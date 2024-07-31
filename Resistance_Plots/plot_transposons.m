load data_wt
load data_transposon

grey=[128 128 128]/256;
red=[255 126 121]/256;
green=[79 143 0]/256;
blue=[0 130 200]/256;

s1=scatter(N([1 4 7],2),N([1 4 7],1),300,green,'filled','LineWidth',1);
hold on
s2=scatter(N([2 5 8],2),N([2 5 8],1),300,red,'filled','LineWidth',1);
s3=scatter(N([3 6],2),N([3 6],1),300,blue,'filled','LineWidth',1);
s4=scatter(N_WT(2),N_WT(1),300,[0 0 0],'filled');
axis([100 1000 100 1000])


text(N(1,2)+30,N(1,1),'Dyn-1','FontSize',20)
text(N(2,2)+30,N(2,1),'Dyn-1','FontSize',20)
text(N(3,2)+70,N(3,1),'Dyn-1','FontSize',20)
text(N(4,2)-60,N(4,1),'Dyn-2','FontSize',20)
text(N(5,2)+30,N(5,1),'Dyn-2','FontSize',20)
text(N(6,2)+70,N(6,1),'Dyn-2','FontSize',20)
text(N(7,2),N(7,1)+20,'Dyn-3','FontSize',20)
text(N(8,2)+25,N(8,1),'Dyn-3','FontSize',20)
text(N_WT(2)-20,N_WT(1)+25,'WT','FontSize',20)

set(gca,'FontSize',15,'YTick',[100 250 500 750 1000],'XTick',[100 250 500 750 1000],'XScale','log','YScale','log')
set(gcf,'render','painters')
xlabel('Steady-State resistance (\mug/ml Tc)','FontSize',20)
ylabel('Dynamnical resistance (\mug/ml Tc)','FontSize',20)

l=legend;
l.String={'No mutations','\DeltaTetR','\DeltaTetR + \DeltaAcrR','WT'};
l.FontSize=20;