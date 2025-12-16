function save_fast(v,expn,res,ts,te,do_fast)
tpath='/work/miz/mat_rce/'; 
fn=strcat(tpath,expn,'_',res,'_ins_',num2str(ts),'_',num2str(te),do_fast,'.mat');
save(fn,'v','-v7.3'); 
return
