load data_resistance

red=[255 126 121]/256;
red2=[255 176 71]/256;
red3=[255 76 171]/256;
green=[79 143 0]/256;
green2=[29 193 0]/256;
green3=[129 93 0]/256;

t={'st','dyn'};
drug=[2-1/6:1/6:3];
days=[0:10];
set(0, 'DefaultFigureRenderer', 'painters');

for i=1:3
    for j=1:2

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

    RR((j-1)*3+i,:)=10.^R;
        
    end
end

figure
hold on
plot(days,RR(1,1:11),'-o','LineWidth',3,'MarkerSize',10,'Color',green2,'MarkerEdgeColor',green2);%,'MarkerFaceColor',green)
plot(days,RR(2,1:11),'-o','LineWidth',3,'MarkerSize',10,'Color',green,'MarkerEdgeColor',green);%,'MarkerFaceColor',green)
plot(days,RR(3,1:11),'-o','LineWidth',3,'MarkerSize',10,'Color',green3,'MarkerEdgeColor',green3);%,'MarkerFaceColor',green)
axis([0 10 0 1000])
set(gca,'FontSize',15,'YTick',[0 500 1000],'YScale','linear','box','off')
h=legend('Steady-1','Steady-2','Steady-3');
h.FontSize=20;
xlabel('Days','FontSize',20)
ylabel('IC_{50} (\mug/ml tetracycline)','FontSize',20)

figure
hold on
plot(days,RR(1,1:11),'-o','LineWidth',2,'MarkerSize',10,'Color',green,'MarkerEdgeColor',green);%,'MarkerFaceColor',green)
plot(days,RR(4,1:11),'-o','LineWidth',3,'MarkerSize',10,'Color',red2,'MarkerEdgeColor',red2);%,'MarkerFaceColor',red)
plot(days,RR(5,1:11),'-o','LineWidth',3,'MarkerSize',10,'Color',red,'MarkerEdgeColor',red);%,'MarkerFaceColor',red)
plot(days,RR(6,1:11),'-o','LineWidth',3,'MarkerSize',10,'Color',red3,'MarkerEdgeColor',red3);%,'MarkerFaceColor',red)
plot(days,RR(2,1:11),'-o','LineWidth',2,'MarkerSize',10,'Color',green,'MarkerEdgeColor',green);%,'MarkerFaceColor',green)
plot(days,RR(3,1:11),'-o','LineWidth',2,'MarkerSize',10,'Color',green,'MarkerEdgeColor',green);%,'MarkerFaceColor',green)
axis([0 10 0 1000])
set(gca,'FontSize',15,'YTick',[0 500 1000],'YScale','linear','box','off')
h=legend('Steady','Dynamic-1','Dynamic-2','Dynamic-3');
h.FontSize=20;
xlabel('Days','FontSize',20)
ylabel('IC_{50} (\mug/ml tetracycline)','FontSize',20)

