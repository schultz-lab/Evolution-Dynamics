load data_resistance

orange=[255 147 0]/256;
blue=[0 162 255]/256;

t={'st','dyn'};
drug=[2-1/6:1/6:3];
days=[0:10];

for n=1:100
    cmap(n,:)=[1 1 1]-(1-blue)*n/200;
end

figure
for i=1:3
    for j=1:2
        subplot(2,3,(j-1)*3+i)
        d=data.(t{j}).(['p' num2str(i)]);
        
        if (i==3 && j==2)
            [G,R]=growth(d,1);
        else
            [G,R]=growth(d,0);
        end
        
        if j==1
            G0=G(1,:);
            R0=R(1);
        else
            G(1,:)=G0;
            R(1)=R0;
        end
            
        imagesc(days,drug,G(1:11,:)')
        set(gca,'YDir','normal')
        colormap(cmap)

        hold on
        plot(days,R(1:11),'-o','LineWidth',4,'MarkerSize',15,'Color',orange,'MarkerEdgeColor',orange)
        caxis([0 0.5]);
        b=colorbar;
        b.Ticks=[0 0.25 0.5];
        set(gca,'FontSize',15,'YTick',[2 3],'YTickLabels',{'10^2','10^3'},'box','off')
        b.Label.String='Growth (doub./hour)';
        b.Label.FontSize=20;
        xlabel('Days','FontSize',20)
        ylabel('IC_{50} (\mug/ml tetracycline)','FontSize',20)
    end
end





