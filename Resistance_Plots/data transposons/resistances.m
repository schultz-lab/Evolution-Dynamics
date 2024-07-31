function N=resistances(M,drug)

N=NaN(6,2);
f=drug(2)/drug(3);
drug(1)=f*drug(2);
drug=log10(drug);
names={'Dyn-1','Dyn-1 \DeltatetR','Dyn-1 \DeltatetR \DeltaacrR','Dyn-2','Dyn-2 \DeltatetR','Dyn-2 \DeltatetR \DeltaacrR','Dyn-3','Dyn-3 \DeltatetR','WT'};

figure
for i=1:8
    
    %a drug concentration at which delay is above 2 hours
    ii=find(~isnan(M(i,:,1)));% & M(i,:,1)>10);
    
    if isempty(ii)
        N(i,1)=10^3.5;%10^max(drug);
    else
        
        %iii=min(ii);
        %ii=[iii-3 iii-2 iii-1 ii];
        ii=ii(max(1,length(ii)-5):end);
        %ii=ii(ii>0);
        
        %b curve fitting drug to delay time for well
        %pd = polyfit( drug(ii) , M(i,ii,1) , 2 );
        f1=fittype('logistic4');
        pd = fit( drug(ii)' , M(i,ii,1)' , f1 );
        drug_range=linspace(min(drug(ii)),1+max(drug),1000);
        %vx = polyval( pd, drug_range );
        vx = feval( pd, drug_range );
        
        ix = find( vx > 120 , 1);
        x = drug_range(ix);
        if(isempty(x))
            N(i,1)=10^min(drug);
        else
            N(i,1)=10^x;
        end
        
    end
    
    subplot(2,8,i)
    plot(10.^drug,squeeze(M(i,:,1))/60,'ko')
    hold on
    plot(10.^drug(ii),squeeze(M(i,ii,1))/60,'ro')
    vx(vx>max(120,M(i,ii(end),1)))=NaN;
    plot(10.^drug_range,vx/60,'b')
    plot(10.^[min(drug-1) max(drug+1)],[2 2],'--k')
    axis([10^1.8 10^3.1 -2.0 12])
    set(gca,'XScale','log')
    box off
    xlabel('Tetracycline (\mug/ml)')
    ylabel('delay (hours)')
    title(names{i},'FontSize',15)

    %a drug concentration at growth is reduced by half
    v=M(i,:,2);
    v(isnan(v))=0;
    i1=find(v==0,1);
    if isempty(i1)
        i1=12;
    end
    ii=[i1-3:i1];
    ii=ii(ii>0);
    
    %a polynomial curve fitting drug to growth rate slope
    %pg = polyfit( drug(ii) , v(ii) , 2 );
    f2=fittype('poly2');
    pg = fit( drug(ii)' , v(ii)' , f2 );
    drug_range=linspace(drug(max(1,i1-3)),1+drug(i1),1000); 
    %vy = polyval( pg, drug_range );
    vy = feval( pg, drug_range );
    g0=M(i,1,2)/2; % max(M(:,i,2))/2 ?
    iy = find( vy < g0 ,1); %% M(1,i,2)/2;
    y = drug_range(iy);
    if(isempty(y))
        N(i,2)=10^min(drug);
    else
        N(i,2)=10^y;
    end
    
    subplot(2,8,8+i)
    plot(10.^drug,60*squeeze(M(i,:,2)),'ko')
    hold on
    plot(10.^drug(ii),60*squeeze(M(i,ii,2)),'ro')
    vy(vy<min(g0,M(i,ii(end),2)))=NaN;
    plot(10.^drug_range,60*vy,'b')
    plot(10.^[min(drug-1) max(drug+1)], 60*M(i,1,2)/2*[1 1],'--k')
    axis([10.^1.8 10.^3.1 0 0.6])
    set(gca,'XScale','log')
    box off
    xlabel('Tetracycline (\mug/ml)')
    ylabel('growth (doub/h)')
    title(names{i},'FontSize',15)
    
end
