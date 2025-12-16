function x=getflx(vx,nn,opt)
if strcmp(opt,'wqt500')
  for i=1:nn; wphi(i)=vx.r(i).wqt500; end
elseif strcmp(opt,'whli500')
  for i=1:nn; wphi(i)=vx.r(i).whli500; end
elseif strcmp(opt,'wmse500')
  for i=1:nn; wphi(i)=vx.r(i).wmse500; end
elseif strcmp(opt,'wqt3km')
  for i=1:nn; wphi(i)=vx.r(i).wqt3km; end
elseif strcmp(opt,'whli3km')
  for i=1:nn; wphi(i)=vx.r(i).whli3km; end
elseif strcmp(opt,'wmse3km')
  for i=1:nn; wphi(i)=vx.r(i).wmse3km; end
elseif strcmp(opt,'wqt3km_a')
  for i=1:nn; wphi(i)=vx.r(i).wqt3km_a; end
elseif strcmp(opt,'wqt2km')
  for i=1:nn; wphi(i)=vx.r(i).wqt2km; end
elseif strcmp(opt,'whli2km')
  for i=1:nn; wphi(i)=vx.r(i).whli2km; end
elseif strcmp(opt,'wmse2km')
  for i=1:nn; wphi(i)=vx.r(i).wmse2km; end
end

x.FA_wup  = combres(wphi,nn,'FA_wup');
x.fa_wup  = combres(wphi,nn,'fa_wup');
x.fx_TOT  = combres(wphi,nn,'fx_TOT');
x.fx_GRD  = combres(wphi,nn,'fx_GRD');
x.fx_tot  = combres(wphi,nn,'fx_tot');
x.fx_grd  = combres(wphi,nn,'fx_grd');
x.fx_edd  = combres(wphi,nn,'fx_edd');
x.fx_ed1  = combres(wphi,nn,'fx_ed1');
x.fx_ed2  = combres(wphi,nn,'fx_ed2');
x.fx_ed1a = combres(wphi,nn,'fx_ed1a');
x.fx_ed2a = combres(wphi,nn,'fx_ed2a');
x.pr_cup  = combres(wphi,nn,'vy_cup');
x.pr_env  = combres(wphi,nn,'vy_env');
x.pr_tot  = combres(wphi,nn,'vybar');
x.vx_cup  = combres(wphi,nn,'vx_cup');
x.vx_env  = combres(wphi,nn,'vx_env');
x.vx_tot  = combres(wphi,nn,'vxbar');
x.mf_cup  = combres(wphi,nn,'mf_cup');
x.mf_env  = combres(wphi,nn,'mf_env');
x.mfvx_cup= combres(wphi,nn,'mfvx_cup');

x.fa_std = combres_std(wphi,nn,'fa_wup');

return



i=1;
FA_wup =wphi(i).avg.FA_wup;
fa_wup =wphi(i).avg.fa_wup;
fa_std =wphi(i).std.fa_wup;
fx_TOT =wphi(i).avg.fx_TOT;
fx_GRD =wphi(i).avg.fx_GRD;
fx_tot =wphi(i).avg.fx_tot;
fx_grd =wphi(i).avg.fx_grd;
fx_edd =wphi(i).avg.fx_edd;
fx_ed1 =wphi(i).avg.fx_ed1;
fx_ed2 =wphi(i).avg.fx_ed2;
fx_ed1a=wphi(i).avg.fx_ed1a;
fx_ed2a=wphi(i).avg.fx_ed2a;
pr_cup =wphi(i).avg.vy_cup;
pr_env =wphi(i).avg.vy_env;
pr_tot =wphi(i).avg.vybar;
for i=2:nn
  FA_wup =[FA_wup  wphi(i).avg.FA_wup];
  fa_wup =[fa_wup  wphi(i).avg.fa_wup];
  fa_std =[fa_std  wphi(i).std.fa_wup];
  fx_TOT =[fx_TOT  wphi(i).avg.fx_TOT];
  fx_GRD =[fx_GRD  wphi(i).avg.fx_GRD];
  fx_tot =[fx_tot  wphi(i).avg.fx_tot];
  fx_grd =[fx_grd  wphi(i).avg.fx_grd];
  fx_edd =[fx_edd  wphi(i).avg.fx_edd];
  fx_ed1 =[fx_ed1  wphi(i).avg.fx_ed1];
  fx_ed2 =[fx_ed2  wphi(i).avg.fx_ed2];
  fx_ed1a=[fx_ed1a wphi(i).avg.fx_ed1a];
  fx_ed2a=[fx_ed2a wphi(i).avg.fx_ed2a];
  pr_cup =[pr_cup  wphi(i).avg.vy_cup];
  pr_env =[pr_env  wphi(i).avg.vy_env];
  pr_tot =[pr_tot  wphi(i).avg.vybar];
end
x.FA_wup =FA_wup;
x.fa_wup =fa_wup;
x.fa_std =fa_std;
x.fx_TOT =fx_TOT;
x.fx_GRD =fx_GRD;
x.fx_tot =fx_tot;
x.fx_grd =fx_grd;
x.fx_edd =fx_edd;
x.fx_ed1 =fx_ed1;
x.fx_ed2 =fx_ed2;
x.fx_ed1a=fx_ed1a;
x.fx_ed2a=fx_ed2a;
x.pr_cup =pr_cup;
x.pr_env =pr_env;
x.pr_tot =pr_tot;
