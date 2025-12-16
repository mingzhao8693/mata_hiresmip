function zx=get_var_comp(freq_ar,id)
%freq_ar=vo.freq_ar; yr1=1979; yr2=2014;
%x=read_oni(yr1,yr2,0.8); id=x.id_elnino;

nyr =length(freq_ar(1,:,1,1)); nt=nyr*12; 
nlat=length(freq_ar(1,1,:,1));
nlon=length(freq_ar(1,1,1,:));
a=freq_ar; a=reshape(a,nt,nlat,nlon);

zx=squeeze(nanmean(a(id,:,:),1));

return
