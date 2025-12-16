function [dtas1,dtas2]=get_dtas(vm,wm,v1,w1)
a0=vm.tas_av_clm.ann; a1=wm.tas_av_clm.ann; dtas1=mean(mean((a1-a0).*vm.aa));
a0=v1.tas_av_clm.ann; a1=w1.tas_av_clm.ann; dtas2=mean(mean((a1-a0).*vm.aa));
return
