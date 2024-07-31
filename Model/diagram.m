D=10.^(3*[1:100]/100);
W=10.^(4*[1:100]/100);

vc=zeros(100,10);
vr=zeros(100,10);
red=[255 126 121]/256;
green=[79 143 0]/256;

for i=1:100
    vr(i,:)=objective_regulated(D(i));
    vc(i,:)=objective_constitutive(D(i));
end

Cc=vc(:,2)*W+log(2)./vc(:,10)*ones(1,100);
Cr=vr(:,2)*W+log(2)./vr(:,10)*ones(1,100);
C=log10(Cr./Cc);

Cmap=zeros(100,3);
for i=1:50
    Cmap(i,:)=green+(1-green)*i/50;
    Cmap(50+i,:)=[1 1 1]-(1-red)*i/50;
end

figure
subplot(1,2,1)
imagesc(D/2.25,W,C',[-1 1])
colormap(Cmap)
h=colorbar;
h.Label.String='Favored architecture';
h.Label.FontSize=20;
h.Ticks=[-1 0 1];
set(gca,'XScale','log','YScale','log','YDir','normal','FontSize',15)
xlabel('Tetracycline concentration (\mug/ml)','FontSize',20)
ylabel('Relative cost of TetA','FontSize',20)
axis([D(1)/2.25 D(end)/2.25 W(1) W(end)])

subplot(1,2,2)
hold on
plot(D,vr(:,10),'Color',green,'LineWidth',4)
plot(D,vc(:,10),'Color',red,'LineWidth',4)
set(gca,'FontSize',15,'XScale','log','YTick',[0 0.005 0.01 0.015])
box off
xlabel('Tetracycline concentration (\mug/ml)','FontSize',20)
ylabel('Growth rate (min^{-1})','FontSize',20)
axis([D(1)/2.25 D(end)/2.25 0 0.016])