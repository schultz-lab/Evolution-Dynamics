load transposon_example

red=[255 126 121]/256;
green=[79 143 0]/256;

p1=plot(t,nodrugtransp,'--','Color',red,'LineWidth',2);
hold on
p2=plot(t,nodrugnotransp,'--','Color',green,'LineWidth',2);
p3=plot(t,transp,'Color',red,'LineWidth',3);
p4=plot(t,notransp,'Color',green,'LineWidth',3);
plot(t(31)*[1 1],[0 1.5],'--k','LineWidth',2)

axis([0 18 0 3])
set(gca,'FontSize',15,'Box','off','XTick',[0 5 10 15],'YTick',[0 1 2 3])
xlabel('Time (hours)','FontSize',20)
ylabel('Doublings','FontSize',20)

i2=find(nodrugnotransp>=1,1);
i3=find(notransp>=1,1);
plot([t(i2) t(i3)],[1 1],'--k','LineWidth',2)

h1=legend([p1 p2],{'\Delta{\ittetR}','WT'});
h1.FontSize=20;
h1.Box='off';

a2 = axes('position',get(gca,'position'),'visible','off');
h2=legend(a2,[p3 p4],{'\Delta{\ittetR}','WT'});
h2.FontSize=20;
h2.Box='off';