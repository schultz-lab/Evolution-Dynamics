function M=growthanddelay(data,t_drug)
% t_drug is time the drug was added in minutes

M=NaN(8,12,2); % delay, growth
M(:,:,2)=0;

names={'St-1','St-2','St-3','Dyn-1','Dyn-2','Dyn-3'};
       
t=data.time;

%time drug was added
i1=find(t>=t_drug,1);

% correction for condensation after drug is added

data.data(i1+1,:,:)=(data.data(i1,:,:)+data.data(i1+4,:,:))/2;
data.data(i1+2,:,:)=(data.data(i1,:,:)+data.data(i1+4,:,:))/2;
data.data(i1+3,:,:)=(data.data(i1,:,:)+data.data(i1+4,:,:))/2;

figure
for i=1:6 
    for j=1:12

        v=log2(data.data(:,j,i));
        i2=[];
        i3=[];
        i4=[];
        o1=v(i1); %log OD at time drug added        
        o2=o1+1; %log OD at time drug added

        % manual correction
        if(i==2) o2=o1+1.3; end

        %row at which log OD is 1 doubling from drug added OD
        i2=find(v(i1:end)>o2,1);
        if(~isempty(i2)) i2=i2+i1-1; end
     
        if ~isempty(i2) 

            if(j==1) tt=t(i2); end

            % delay
            M(i,j,1)=t(i2)-tt;

            o3=o1+1.2; % dyn1=0.3
            o4=o1+2; % dyn2=1
            
            % manual corrections
            if(j>10) o3=o1+1; o4=max(v); end
            if(i==2 && j==1) o4=o1+2.2; end
            if(i==2) o3=o1+0.5; end

            i3=find(v(i2:end)>o3,1);
            if(~isempty(i3)) 
                i3=i3+i2-1;
                i4=find(v(i3:end)>=o4,1);
                if(~isempty(i4))
                    i4=i4+i3-1;
                else
                    i4=length(v);
                end
            end

            % growth
            c=polyfit(t(i3:i4),v(i3:i4)',1);
            M(i,j,2)=c(1);
               
        end
        
        subplot(6,12,(i-1)*12+j)
        plot(t,v,'b')
        hold on
        plot([t_drug t_drug],[-3.6 -0.3],'--k','LineWidth',1)
        plot(t,log2(squeeze(data.data(:,1,i))),'--k','LineWidth',2)
        plot(t(i3:i4),polyval(c,t(i3:i4)),'r','LineWidth',3)
        plot(t(i2),v(i2),'ro')
        if(j==1) title(names{i},'FontSize',15); end
        if(j==1 && i==6)
            xlabel('Time (hours)')
            ylabel('log_2(OD)')
            set(gca,'YTick',[-3 -2 -1],'XTick',60*[0 5 10 15],'XTickLabels',{'0','5','10','15'})
            box off
        else
            axis off
        end
        
    end
end


    
end


