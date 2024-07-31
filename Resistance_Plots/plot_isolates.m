load data_wt
load data_isolates

% 1 - red - AcrB (TetR)
% 2 - blue - TetR (AcrB)
% 3 - yellow - other (AcrB regulation)
% 4 - green - AcrB regulation (other)

hold on
plotcircle(N(1,2),N(1,1)-20,40,[0 0 0 1])
text(N(1,2)+75,N(1,1)-30,'Std-1','FontSize',20)

plotcircle(N(2,2),N(2,1)+20,40,[1 0 0 1])
text(N(2,2)-250,N(2,1)+40,'Std-3','FontSize',20)

plotcircle(N(3,2),N(3,1),40,[0 1 0 1])
text(N(3,2)+75,N(3,1),'Dyn-1','FontSize',20)

plotcircle(N(4,2),N(4,1),40,[1 0 1 1])
text(N(4,2)+75,N(4,1),'Std-2','FontSize',20)

plotcircle(N(5,2),N(5,1),40,[1 0 1 1])
text(N(5,2)+75,N(5,1),'Std-2','FontSize',20)

plotcircle(N(6,2),N(6,1),40,[0 1 1 1])
text(N(6,2)+75,N(6,1),'Dyn-2','FontSize',20)

plotcircle(N(7,2),N(7,1),40,[0 1 0 1])
text(N(7,2)-300,N(7,1),'Dyn-3','FontSize',20)

plotcircle(N(8,2),N(8,1),40,[0 0 1 1])
text(N(8,2)-300,N(8,1)+50,'Dyn-3','FontSize',20)

plotcircle(N(9,2),N(9,1),40,[0 0 1 1])
text(N(9,2)+75,N(9,1)-30,'Std-1','FontSize',20)

scatter(N_WT(2),N_WT(1),300,[0 0 0],'filled')
text(N_WT(2)+75,N_WT(1),'WT','FontSize',20)

axis([0 1300 0 1300])

set(gca,'FontSize',15,'YTick',[0 400 800 1200],'XTick',[0 400 800 1200])
set(gcf,'render','painters')
xlabel('Steady-State resistance (\mug/ml Tc)','FontSize',20)
ylabel('Dynamnical resistance (\mug/ml Tc)','FontSize',20)