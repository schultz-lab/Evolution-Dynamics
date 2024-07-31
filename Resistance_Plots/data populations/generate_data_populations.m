load data_raw_populations

M=growthanddelay(data_raw_populations,120);

drug=[0 10.^[2:1/10:3]];
names={'Std-1','Std-2','Std-3','Dyn-1','Dyn-2','Dyn-3'};

N=resistances(M,drug);

save data_populations drug names M N