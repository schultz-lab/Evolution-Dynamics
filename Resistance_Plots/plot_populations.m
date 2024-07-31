load data_wt
load data_populations

red=[255 126 121]/256;
green=[79 143 0]/256;

s1=scatter(N(1:3,2),N(1:3,1),300,green,'filled','LineWidth',1);
hold on
s2=scatter(N(4:6,2),N(4:6,1),300,red,'filled','LineWidth',1);
scatter(N_WT(2),N_WT(1),300,[0 0 0],'filled')
axis([0 1500 0 1500])

for i=[2 4 5 6]
    text(N(i,2)+65,N(i,1),names{i},'FontSize',20)
end
text(N(1,2)-50,N(1,1)-80,names{1},'FontSize',20)
text(N(3,2)+40,N(3,1)+50,names{3},'FontSize',20)
text(N_WT(2)+75,N_WT(1),'WT','FontSize',20)

axis([0 1300 0 1300])
set(gca,'FontSize',15,'YTick',[0 400 800 1200],'XTick',[0 400 800 1200])
set(gcf,'render','painters')
xlabel('Steady-State resistance (\mug/ml Tc)','FontSize',20)
ylabel('Dynamnical resistance (\mug/ml Tc)','FontSize',20)