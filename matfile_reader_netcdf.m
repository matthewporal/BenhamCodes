%% create mat files from hycom nc files with ncread

row = 450; 
col = 499;
depth = 33;
time = 18;

umat = zeros(row,col,depth,time)*NaN;
vmat = zeros(row,col,depth,time)*NaN;
tmat = zeros(row,col,depth,time)*NaN;
smat = zeros(row,col,depth,time)*NaN;

lat = ncread('hycom_expt_91.1phil_2014-05-03.nc','Latitude');
lon = ncread('hycom_expt_91.1phil_2014-05-03.nc','Longitude');
dep = ncread('hycom_expt_91.1phil_2014-05-03.nc', 'Depth');

for jd=2:time

    dat=datestr(datenum(2014,5,jd),29);
    fname=sprintf('hycom_expt_91.1phil_%s.nc',dat);
    uvel=ncread(fname,'u');
    umat(:,:,:,jd)=uvel;
    vvel=ncread(fname,'v');
    vmat(:,:,:,jd)=vvel;
    sal=ncread(fname,'salinity');
    smat(:,:,:,jd)=sal;
    tem=ncread(fname,'temperature');
    tmat(:,:,:,jd)=tem;
    
    %clear uvel vvel sal tem;
 end
 
clear col depth dat fname jd row s time

% Check array

% dat = datestr(datenum(2014,0,84),29);
% fname = sprintf('expt_91.0phil_%s.nc',dat);
% uvel = ncread(fname,'u');
% a = uvel(:,:,1);
% b = umat(:,:,1,25);
% c = a-b

% clear a b c dat fname uvel 