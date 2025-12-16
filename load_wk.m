function v=load_wk(fn)
%fn='WK_stps_1979-2005.dailynormalfullyear.p.nc'
f = netcdf(fn, 'nowrite');
v.x=f{'x'}(:); v.y=f{'y'}(:); v.t=f{'t'}(:);
v.var_sym      =f{'var_sym'}(:,:,:);
v.var_asym     =f{'var_asym'}(:,:,:);
v.var_tot      =f{'var_tot'}(:,:);
v.var_sym_filt =f{'var_sym_filt'}(:,:);
v.var_asym_filt=f{'var_asym_filt'}(:,:); close(f);
v.var_sym0 =squeeze(mean(v.var_sym,3));
v.var_asym0=squeeze(mean(v.var_asym,3))';
return
