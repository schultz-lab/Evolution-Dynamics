function M=growthanddelay(data,t_drug,names)
% t_drug is time the drug was added in minutes

M=NaN(9,12,2); % delay, growth
M(:,:,2)=0;
ii=[1 5 6 3 4 7 8 9 2];

figure
for i=1:9 
    for j=1:12

        if i<3
            t=data.time(:,1);
        elseif i<6
            t=data.time(:,2);
        elseif i<9
            t=data.time(:,3);
        else
            t=data.time(:,4);
        end
        i1=find(t>=t_drug,1);

        % correction for condensation after drug is added
        data.data(i1+1,:,:)=(data.data(i1,:,:)+data.data(i1+4,:,:))/2;
        data.data(i1+2,:,:)=(data.data(i1,:,:)+data.data(i1+4,:,:))/2;
        data.data(i1+3,:,:)=(data.data(i1,:,:)+data.data(i1+4,:,:))/2;

        v=log2(data.data(:,j,i));
        i2=[];
        i3=[];
        i4=[];
        o1=v(i1); %log OD at time drug added        
        o2=o1+1; %log OD at time drug added

        % manual corrections
        if(i==1 && j>6) o2=o1+1.3; end %
        if(i==1 && j>9) o2=o1+1.5; end %
        if(i==2 && j>6) o2=o1+1.2; end %
        if(i==2 && j>10) o2=o1+1.4; end %
        %if(i==7 && j>10) o2=o1+1.2; end %
        %if(i==10 && j==12) o2=o1+1.3; end
        %if(i==12 && j>1) o2=o1+1.1; end %
        %if(i==12 && j>11) o2=o1+1.3; end %
        if(i==4 && j>1) o2=o1+1.1; end %if(i==14 && j>1) o2=o1+1.1; end %
        %if(i==16 && j>4) o2=o1+1.3; end %
        %if(i==17 && j>6) o2=o1+1.2; end %
        if(i==8 && j>10) o2=o1+1.1; end %if(i==22 && j>10) o2=o1+1.1; end %

        if(i==3 && j==11) o2=o1+0.9; end %
        if(i==9 && j>7) o2=o1+1.4; end %

        %row at which log OD is 1 doubling from drug added OD
        i2=find(v(i1:end)>o2,1);
        if(~isempty(i2)) i2=i2+i1-1; end
     
        if ~isempty(i2) 

            if(j==1) tt=t(i2); end

            % delay
            M(i,j,1)=t(i2)-tt;

            o3=o2+0.3;
            o4=o2+0.8;

            % manual corrections
            if(i==1 && j==11) o3=o2; o4=o2+0.4; end %
            %if(i==9 && j==11) o3=o2-0.1; o4=o2+0.2; end 
            %if(i==11 && j==11) o3=o2-0.1; o4=o2+0.2; end 
            %if(i==13 && j>10) o3=o2+0.2; o4=o2+0.7; end %

            if(i==8 && j==11) o3=o2+0.1; o4=o2+0.5; end %
            if(i==9 && j>7) o3=o2+0.2; o4=o2+0.7; end %

            i3=find(v(i2:end)>o3,1);
            if(~isempty(i3)) 
                i3=i3+i2-1;
                i4=find(v(i3:end)>o4,1);
                if(~isempty(i4))
                    i4=i4+i3-1;
                else
                    i4=length(v);
                end
            end

            % growth
            c=polyfit(t(i3:i4),v(i3:i4),1);
            M(i,j,2)=c(1);
               
        end 
        
        subplot(9,12,(ii(i)-1)*12+j)
        plot(t,v,'b')
        hold on
        plot([t_drug t_drug],[-3.6 -0.3],'--k','LineWidth',1)
        plot(t,log2(squeeze(data.data(:,1,i))),'--k','LineWidth',2)
        plot(t(i3:i4),polyval(c,t(i3:i4)),'r','LineWidth',3)
        plot(t(i2),v(i2),'ro')
        if(j==1) title(names{i},'FontSize',12); end
        if(j==1 && ii(i)==9)
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


