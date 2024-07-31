load data_progression

orange=[255 147 0]/256;
blue=[0 162 255]/256;

t=data.time;
tt=t/(24*60);

figure
subplot(2,3,1)
od=data.OD(:,1);
d=1000*data.PercentDrug(:,1);
yyaxis right
plot(tt,d,'-','LineWidth',2,'Color',orange)
set(gca,'YTick',[0 250 500 750],'YColor',orange,'XLim',[0 11],'FontSize',15,'box','off')
ylim([0 1000])
yyaxis left
plot(tt,od,'-','LineWidth',2,'Color',blue)
set(gca,'YTick',[0 0.1 0.2 0.3 0.4],'YColor',blue,'XLim',[-0.17 11],'FontSize',15,'box','off')
ylim([0 0.45])
ylabel('OD','FontSize',20)
yyaxis right
xlabel('Time (days)','FontSize',20)
ylabel('Tetracycline(\mug/ml)','FontSize',20)

subplot(2,3,2)
od=data.OD(:,3);
d=1000*data.PercentDrug(:,3);
yyaxis right
plot(tt,d,'-','LineWidth',2,'Color',orange)
set(gca,'YTick',[0 250 500 750],'YColor',orange,'XLim',[0 11],'FontSize',15,'box','off')
ylim([0 1000])
yyaxis left
plot(tt,od,'-','LineWidth',2,'Color',blue)
set(gca,'YTick',[0 0.1 0.2 0.3 0.4],'YColor',blue,'XLim',[-0.17 11],'FontSize',15,'box','off')
ylim([0 0.45])
ylabel('OD','FontSize',20)
yyaxis right
xlabel('Time (days)','FontSize',20)
ylabel('Tetracycline(\mug/ml)','FontSize',20)

subplot(2,3,3)
od=data.OD(:,5);
d=1000*data.PercentDrug(:,5);
yyaxis right
plot(tt,d,'-','LineWidth',2,'Color',orange)
set(gca,'YTick',[0 250 500 750],'YColor',orange,'XLim',[0 11],'FontSize',15,'box','off')
ylim([0 1000])
yyaxis left
plot(tt,od,'-','LineWidth',2,'Color',blue)
set(gca,'YTick',[0 0.1 0.2 0.3 0.4],'YColor',blue,'XLim',[-0.17 11],'FontSize',15,'box','off')
ylim([0 0.45])
ylabel('OD','FontSize',20)
yyaxis right
xlabel('Time (days)','FontSize',20)
ylabel('Tetracycline(\mug/ml)','FontSize',20)

subplot(2,3,4)
od=data.OD(:,2);
d=1000*data.PercentDrug(:,2);
%ii=find(diff(d)>0);
ii=[[1:12096] [13096:19820] [20820:31987]];
ttt=tt(ii);
ttt(12097:end)=ttt(12097:end)-0.3221;
ttt(18822:end)=ttt(18822:end)-0.3357;
yyaxis right
plot(ttt-0.17,d(ii),'LineWidth',3,'Color',orange)
set(gca,'YTick',[0 250 500 750],'YColor',orange,'XLim',[-0.17 10],'FontSize',15,'box','off')
ylim([0 750])
yyaxis left
plot(ttt-0.17,od(ii),'LineWidth',2,'Color',blue)
set(gca,'YTick',[0 0.1 0.2 0.3 0.4],'YColor',blue,'XLim',[-0.17 10],'FontSize',15,'box','off')
ylim([0 0.3])
ylabel('OD','FontSize',20)
yyaxis right
xlabel('Time (days)','FontSize',20)
ylabel('Tetracycline (\mug/ml)','FontSize',20)

subplot(2,3,5)
od=data.OD(:,4);
d=1000*data.PercentDrug(:,4);
%ii=find(diff(d)>0);
ii=[[1:12096] [13096:19820] [20820:31987]];
ttt=tt(ii);
ttt(12097:end)=ttt(12097:end)-0.3221;
ttt(18822:end)=ttt(18822:end)-0.3357;
yyaxis right
plot(ttt-0.17,d(ii),'LineWidth',3,'Color',orange)
set(gca,'YTick',[0 250 500 750],'YColor',orange,'XLim',[-0.17 10],'FontSize',15,'box','off')
ylim([0 750])
yyaxis left
plot(ttt-0.17,od(ii),'LineWidth',2,'Color',blue)
set(gca,'YTick',[0 0.1 0.2 0.3 0.4],'YColor',blue,'XLim',[-0.17 10],'FontSize',15,'box','off')
ylim([0 0.3])
ylabel('OD','FontSize',20)
yyaxis right
xlabel('Time (days)','FontSize',20)
ylabel('Tetracycline (\mug/ml)','FontSize',20)

subplot(2,3,6)
od=data.OD(:,6);
d=1000*data.PercentDrug(:,6);
%ii=find(diff(d)>0);
ii=[[1:12096] [13096:19820] [20820:31987]];
ttt=tt(ii);
ttt(12097:end)=ttt(12097:end)-0.3221;
ttt(18822:end)=ttt(18822:end)-0.3357;
yyaxis right
plot(ttt-0.17,d(ii),'LineWidth',3,'Color',orange)
set(gca,'YTick',[0 250 500 750],'YColor',orange,'XLim',[-0.17 10],'FontSize',15,'box','off')
ylim([0 750])
yyaxis left
plot(ttt-0.17,od(ii),'LineWidth',2,'Color',blue)
set(gca,'YTick',[0 0.1 0.2 0.3 0.4],'YColor',blue,'XLim',[-0.17 10],'FontSize',15,'box','off')
ylim([0 0.3])
ylabel('OD','FontSize',20)
yyaxis right
xlabel('Time (days)','FontSize',20)
ylabel('Tetracycline (\mug/ml)','FontSize',20)


