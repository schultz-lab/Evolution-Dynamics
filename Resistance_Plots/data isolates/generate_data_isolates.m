load data_raw_isolates

names={'St-1 p-acrRAB transp.','St-3 \DeltaacrR+acrB','Dyn-1 \DeltatetR+\DeltaacrR','St-2 p-acrRAB+ompR+acrB','St-2 p-acrRAB+ompR+acrB','Dyn-2 \DeltatetR+\DeltaacrR+rpoB','Dyn-3 \DeltatetR+acrR','Dyn-3 ompR+p-acrRAB','St-1 p-acrRAB transp.+plsB'};
    
M=growthanddelay(data_raw_isolates,60,names);

drug=[0 10.^[2:1/10:3]];

N=resistances(M,drug,names);

save data_isolates drug names M N