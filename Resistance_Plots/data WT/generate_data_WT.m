load data_raw_WT

M_WT=growthanddelay_WT(data_raw_WT,60);

drug=[0 10.^[2:1/10:3]];

N_WT=resistances_WT(M_WT,drug);

save data_WT drug M_WT N_WT