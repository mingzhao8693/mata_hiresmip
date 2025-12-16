tpath='/archive/Ming.Zhao/awg/warsaw/'; expn='c96L33_am4p0'; 
epath='/tc/track/output/'; fn='ts.txt.z1y-warm.t17_0.TS.world.19800101-20150101.txt'
rdlhtraj(tpath,expn,epath,fn)

tpath='/archive/miz/awg/warsaw/';
epath='/analysis/tropical_storms_wsfc/';
expn ='c96L33_am4p0'; 
fn=strcat(tpath,expn,epath,expn,'_traj_lh.mat');      vm3=regionstat_ibtracs(fn,'mod');

fn=strcat(tpath,expn,epath,expn,'_traj_lh_16.mat');   vm1=regionstat_ibtracs(fn,'mod');

fn=strcat(tpath,expn,epath,expn,'_traj.mat');         vm0=regionstat_ibtracs(fn,'mod');

fn=strcat(tpath,expn,epath,expn,'_traj_old.mat');     vm2=regionstat_ibtracs(fn,'mod');

fn=strcat(tpath,expn,epath,expn,'_traj_lh_14_5.mat'); vm1=regionstat_ibtracs(fn,'mod');
fn=strcat(tpath,expn,epath,expn,'_traj_lh_13_0.mat'); vm2=regionstat_ibtracs(fn,'mod');
fn=strcat(tpath,expn,epath,expn,'_traj_lh_14_0.mat'); vm3=regionstat_ibtracs(fn,'mod');
%v=regionstat_ibtracs_ih(fn,opt)
%path (path,'/home/miz/AM2p12b/analysis/miztstorm/mizscripts/matlab/')
%latbnd=45; opt='mod';

fn=strcat(tpath,expn,epath,expn,'_traj.mat'); vm0=regionstat_ibtracs(fn,'mod'); 

t=2012; plottraj(vm0, t); plottraj(vm3, t); plottraj(vm1, t);

t=5;
vm0.cat0num(:,t)'
vm1.cat0num(:,t)'
vm3.cat0num(:,t)'


figure; k=2;
plot(vm0.cat0sea(k,:),'b'); hold on; plot(vm1.cat0sea(k,:),'r'); 
plot(ob.cat0sea(k,:),'k');plot(vm2.cat0sea(k,:),'c'); plot(vm3.cat0sea(k,:),'g'); 

figure; k=5;
plot(vm0.cat0num(k,:),'b'); hold on; plot(vm1.cat0num(k,:),'r'); 
plot(ob.cat0num(k,:),'k'); plot(vm2.cat0num(k,:),'c'); plot(vm3.cat0num(k,:),'g');


k=5;
corrcoef(vm0.cat0num(k,:), vm1.cat0num(k,:))
corrcoef(vm1.cat0num(k,:), vm3.cat0num(k,:))

corrcoef(vm0.cat0num(k,:), ob.cat0num(k,:))

corrcoef(vm1.cat0num(k,:), ob.cat0num(k,:))

corrcoef(vm2.cat0num(k,:), ob.cat0num(k,:))

corrcoef(vm2.cat0num(k,:), vm0.cat0num(k,:))


t=1; vm0.cat0num(

plottraj(vm2, year); 

plottraj(vm3, year); 

plottraj(vm4, year); 
