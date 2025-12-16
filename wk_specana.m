function v=wk_specana(tpath,expn,yr1,yr2,yrs,nyr,latlon,region,varn,cald,opt)
% Gus Alaka, Jr.
%Read in waves from a single latitude (equator) and perform spectral analysis.
%nc64startup; clear;
%tpath='/archive/Ming.Zhao/awg/verona/';
%expn='c96L33_am4g12r20'; yr1='1980'; yr2='2014'; yrs='1981'; cald='JULIAN'
%varn='olr'; latlon=[0 360 -15 15]; region='gtrop';
%expn='c48l24_am2p14_C0'; yr1='1981'; yr2='1990'; yrs=1981; cald='NOLEAP'
%tpath='/archive/Ming.Zhao/awg/verona/';
%latlon=[0 360 -15 15]; region='gtrop'; varn='olr';
%expn='CM4_hist'; yr1='1981'; yr2='2014'; yrs=1981; cald='NOLEAP'

fext=strcat('atmos.',yr1,'0101-',yr2,'1231.');
fn   =strcat(tpath,expn,'/atmos_daily/',fext,varn,'.nc')
fnout=strcat(tpath,expn,'/',expn,'_',region,'_',varn,'_WK')

experiment=expn; varb=varn;
min_lat=latlon(3); max_lat=latlon(4);
IC_yr=str2num(yr1); end_yr=str2num(yr2); 
start_yr=str2num(yrs); end_yr=start_yr+nyr-1; %IC_yr;
calendar=cald; t_interval=-1;

% $$$ % Read in the inputs
% $$$ fid = fopen('WK_input.ext');
% $$$ experiment=fgetl(fid);
% $$$ varb=fgetl(fid);
% $$$ min_lat=str2num(fgetl(fid));
% $$$ max_lat=str2num(fgetl(fid));
% $$$ IC_yr=str2num(fgetl(fid));
% $$$ start_yr=str2num(fgetl(fid));
% $$$ end_yr=str2num(fgetl(fid));
% $$$ calendar=fgetl(fid);
% $$$ t_interval=fgetl(fid);

% Define constants.
ff=0;
ss=0;
PEES_tot = 0;
PEEA_tot = 0;
PEES_avg = 0;
PEEA_avg = 0;
PEES_log_tot = 0;
PEEA_log_tot = 0;
t_index = 1;

% Read in the NetCDF file and define more constants.

%fn = 'input.nc';
nc = netcdf(fn, 'nowrite');
lat = nc{'latitude'};               % Read in the latitude.
lon = nc{'longitude'};              % Read in the longitude.
if isempty(lat); lat = nc{'lat'}(:); end;
if isempty(lon); lon = nc{'lon'}(:); end;
time =nc{'time'};                   % Read in the time.
EEr = nc{varb};                     % Read in the total array.
size(EEr);

mean_lat = (max_lat + min_lat)/2;
                       
t_comp = strcmp(t_interval,'3hr');
if t_comp
    hr = 8;
else
    hr = 1;
end

NT = hr*364;                        % Define the length of one year of data.
NL = length(lon);                   % How long is the longitude array?
nlat = length(lat);                 % How long is the latitude array?
lat_step = 180/(2*fix(nlat/2));     % What is the interval between latitudes?
nlatd2 = fix(nlat/2);
m = NL*NT;
range = (2*(max_lat - mean_lat)/lat_step) + 1;         % The range of latitude values    
ranged2 = fix(range/2);
lat_low = (nlatd2)-(ranged2-1);     % What is the lowest latitude index?
lat_high = (nlatd2)+(ranged2+1);    % What is the highest latitude index?
n_yrs = end_yr - start_yr + 1;      % Number of years that are analyzed.


% Identify the correct starting time index.  If lp_data is 0, then the data
% contains leap years.

cal_comp = strcmp(calendar,'NOLEAP');
if cal_comp
    lp_data = 1;
else
    lp_data = 0;
end

if start_yr > IC_yr
    for k = IC_yr:start_yr-1
        lp_float = IC_yr/4;
        lp_fix = fix(lp_float);
        lp_dif = lp_float - lp_fix;

        if lp_dif == 0 && lp_data == 0
            t_index = t_index + NT + 2;
        else
            t_index = t_index + NT + 1;
        end
    end
end

      
% Analyze the data year by year and combine values for a multi-year
% average.

for k = 1:n_yrs

    globmean = 0;                   % Global mean value of the data for one latitude.
    totvar = 0;                     % Total variance for one latitude.
    PEES_tot = 0;
    PEEA_tot = 0;
    
    % Regrid the array.
    t_index_end = t_index + NT -1;
%    EEr_3d(:,:,:)=EEr(t_index:t_index_end,1,:,:);
    EEr_3d(:,:,:)=EEr(t_index:t_index_end,:,:);
    size(EEr_3d);
    EEr3da = permute(EEr_3d,[3 1 2]);

    % Find the current year and increment the time index.
    current_yr = start_yr + k - 1;
    lp_float = current_yr/4;
    lp_fix = fix(lp_float);
    lp_dif = lp_float - lp_fix;

    if lp_dif == 0 && lp_data == 0
        t_index = t_index + NT + 2;
    else
        t_index = t_index + NT + 1;
    end
        
    % Find the Total Variance and Global Mean. 
    for i = lat_low:lat_high
        j = i-lat_low+1;        % Define a lower index.
        globmean = 0;
        
        for t=1:NT
            for n=1:NL
                totvar = totvar + ((EEr3da(n,t,i)-globmean)^2)/m;
                globmean = globmean + (EEr3da(n,t,i)/m);
            end
        end
        
        % Subtract the global mean.
        EEr_nomean(:,:,j) = EEr3da(:,:,i) - globmean;
    end

    
    % Calculate the symmetric and assymetric grids from 15S-15N.

    for j = 1:range
        % Create the Symmetric (sym) and Asymmetric (asym) arrays.  Also, sum up
        % the symmetric power components and the assymetric power components
        % individually.

        sym(:,:,j) = (EEr_nomean(:,:,j) + EEr_nomean(:,:,range+1-j))/2;
        asym(:,:,j) = (EEr_nomean(:,:,j) - EEr_nomean(:,:,range+1-j))/2;

        sym_fft2(:,:,j) = fft2(sym(:,:,j),NL,NT)/m;

        asym_fft2(:,:,j) = fft2(asym(:,:,j),NL,NT)/m;

    
        % Rearrange the Power Spectrum.
        for pt=1:NT+1
            for pn=1:NL+1
                if pn <= NL/2
                    n=NL/2+2-pn;
                    if pt <= NT/2
                        t=NT/2+pt;
                    else
                        t=pt-NT/2;
                    end
                elseif pn >= NL/2+1
                    n=pn-NL/2;
                    if pt <= NT/2+1 
                        t=NT/2+2-pt;
                    else
                        t=NT+NT/2+2-pt;
                    end
                end
                PEES(pn,pt,j) = abs((sym_fft2(n,t,j)))^2;
                PEEA(pn,pt,j) = abs((asym_fft2(n,t,j)))^2;
            end
        end


        % Take the negative frequencies (t or pt) and add to corresponding
        % positive frequencies.

        for t=2:(NT/2)+1
            for n=1:NL+1
                PEES_pos_freq(n,(NT/2)-t+3,j) = PEES(n,NT-t+3,j);
                PEES_pos_freq(n,1,j) = PEES(n,(NT/2)+1,j);


                PEEA_pos_freq(n,(NT/2)-t+3,j) = PEEA(n,NT-t+3,j);
                PEEA_pos_freq(n,1,j) = PEEA(n,(NT/2)+1,j);
            end
        end

        PEES_tot = PEES_tot + PEES_pos_freq(:,:,j);
        PEEA_tot = PEEA_tot + PEEA_pos_freq(:,:,j);
    end

    PEES_yrly(:,:,k) = PEES_tot;
    PEEA_yrly(:,:,k) = PEEA_tot;
    
    PEES_avg = PEES_avg + (PEES_tot/n_yrs);
    PEEA_avg = PEEA_avg + (PEEA_tot/n_yrs);

    k                   % Read out the year number.
end


% Define the background data.

PEE_back = (PEES_avg + PEEA_avg)/2;
size(PEE_back)


% Create a simple 1-2-1 smoother that takes the edges into account.

x = PEE_back;
n_pass_hi = 40;         % Number of passes through the filter.
n_pass_lo = 10;
fb = 2.2;

for q = 1:n_pass_lo
    for i = 1:length(x(:,1))
        for j = 1:length(x(1,:))
            if j == 1
                y(i,j) = (2/3)*x(i,j) +(1/3)*x(i,j+1);
            elseif j == length(x(1,:))
                y(i,j) =(2/3)*x(i,j) + (1/3)*x(i,j-1);
            else
                y(i,j) = 0.25*x(i,j-1) + 0.5*x(i,j) + 0.25*x(i,j+1);
            end
        end
    end
     x = y;
end

for q = 1:n_pass_lo
    for j = 1:fix(length(x(1,:))/fb)
        for i = 1:length(x(:,1))
            if i == 1
                y(i,j) = (2/3)*x(i,j) + (1/3)*x(i+1,j);
            elseif i == length(x(:,1))
                y(i,j) = (2/3)*x(i,j) + (1/3)*x(i-1,j);
            else
                y(i,j) = 0.25*x(i-1,j) + 0.5*x(i,j) + 0.25*x(i+1,j);
            end
        end
    end
    x(:,1:fix(length(x(1,:))/fb)) = y(:,1:fix(length(x(1,:))/fb));
end

for q = 1:n_pass_hi
    for j = fix(length(x(1,:))/fb)+1:length(x(1,:))
        for i = 1:length(x(:,1))
            if i == 1
                y(i,j) = (2/3)*x(i,j) + (1/3)*x(i+1,j);
            elseif i == length(x(:,1))
                y(i,j) = (2/3)*x(i,j) + (1/3)*x(i-1,j);
            else
                y(i,j) = 0.25*x(i-1,j) + 0.5*x(i,j) + 0.25*x(i+1,j);
            end
        end
    end
    x(:,fix(length(x(1,:))/fb)+1:length(x(1,:))) = y(:,fix(length(x(1,:))/fb)+1:length(x(1,:)));
end

PEE_back_sm = y;


% Normalize the symmetric and asymmetric components by the background spectrum.

PEES_filt = PEES_avg./PEE_back_sm;
PEEA_filt = PEEA_avg./PEE_back_sm;


% Change the terms to corresponding frequencies (ff) and wavenumbers (ss)

for t=(NT/2)+1:NT+1
   ff(t-(NT/2),1) = (t-1-(NT/2))/NT;
end
for n=1:NL+1
    ss(n,1) = n-1-(NL/2);
end

%save a mat file%%%%%%%
v.x = ss; v.y = ff; v.t = start_yr:end_yr;
v.var_sym  = PEES_yrly(:,:,:);
v.var_asym = PEEA_yrly(:,:,:);
v.var_tot  = (PEE_back_sm(:,:))';
v.var_sym_filt = (PEES_filt(:,:))';
v.var_asym_filt= (PEEA_filt(:,:))';
v.var_sym0  =(squeeze(mean(v.var_sym,3)))';
v.var_asym0 =(squeeze(mean(v.var_asym,3)))';
%fn=strcat(fnout,'.mat'); v.fn=fn; v.varn=varn; save(fn,'v');
%%%%%%%%%%%%%%%%%%%%%%%%
if (opt==0)
  return
end
% Write PEES_yrly, PEEA_yrly, PEE_back_sm, PEES_filt, PEEA_filt to a NetCDF file.

nc = netcdf(strcat(fnout,'.nc'),'clobber');
nc('y')=length(ff);
nc('x')=length(ss);
nc('t')=n_yrs;

nc{'x'} = 'x';
nc{'y'} = 'y';
nc{'t'} = 't';
nc{'var_sym'} = ncfloat('x', 'y', 't');
nc{'var_asym'} = ncfloat('x', 'y', 't');
nc{'var_tot'} = ncfloat('x', 'y');
nc{'var_sym_filt'} = ncfloat('x', 'y');
nc{'var_asym_filt'} = ncfloat('x', 'y');

nc{'x'}.long_name = 'zonal modes';
nc{'y'}.long_name = 'temporal harmonics';
nc{'t'}.long_name = 'years';
nc{'var_sym'}.long_name = 'none';
nc{'var_asym'}.long_name = 'none';
nc{'var_tot'}.long_name = 'none';
nc{'var_sym_filt'}.long_name = 'none';
nc{'var_asym_filt'}.long_name = 'none';

nc{'x'}.units = 'none';
nc{'y'}.units = 'none';
nc{'t'}.units = 'none';
nc{'var_sym'}.units = 'none';
nc{'var_asym'}.units = 'none';
nc{'var_tot'}.units = 'none';
nc{'var_sym_filt'}.units = 'none';
nc{'var_asym_filt'}.units = 'none';

nc{'x'}(:) = ss;
nc{'y'}(:) = ff;
nc{'t'}(:) = start_yr:end_yr;
nc{'var_sym'}(:,:,:) = PEES_yrly(:,:,:);
nc{'var_asym'}(:,:,:) = PEEA_yrly(:,:,:);
nc{'var_tot'}(:,:) = PEE_back_sm(:,:);
nc{'var_sym_filt'}(:,:) = PEES_filt(:,:);
nc{'var_asym_filt'}(:,:) = PEEA_filt(:,:);
nc=close(nc);
return
%quit
