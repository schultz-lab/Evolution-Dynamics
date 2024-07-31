load data_raw_transposon

M=growthanddelay(data_raw_transposon,60);

drug=[0 10.^[2:1/10:3]];
names={'Dyn-1','Dyn-1 \DeltatetR','Dyn-1 \DeltatetR \DeltaacrR','Dyn-2','Dyn-2 \DeltatetR','Dyn-2 \DeltatetR \DeltaacrR','Dyn-3','Dyn-3 \DeltatetR'};

N=resistances(M,drug);

save data_transposon drug names M N