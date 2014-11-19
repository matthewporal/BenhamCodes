U = zeros(450,499,18);
V = zeros(450,499,18);
for i=1:18
    uu = ncread(['hycom_expt_91.1phil_2014-05-' num2str(i+1) '.nc'],'u');
    vv = ncread(['hycom_expt_91.1phil_2014-05-' num2str(i+1) '.nc'],'v');
    uuu = uu(:,:,2);
    vvv = vv(:,:,2);
    U(:,:,i) = uuu;
    V(:,:,i) = vvv;
end

t = 1:1:18;

lat = ncread('hycom_expt_91.1phil_2014-05-03.nc','Latitude');
lon = ncread('hycom_expt_91.1phil_2014-05-03.nc','Longitude');
latnew = lat(1,1:499);
lonnew = lon(1:450,1);
[rlat,clat,vlat] = find(latnew>=15 & latnew<=19);
[rlon,clon,vlon] = find(lonnew>=123 & lonnew<=127);
trlon = rlon';
lonsize = size(trlon);
latsize = size(clat);
for i = 1:lonsize(1,2)
    for j = 1:latsize(1,2)
        longitude(i,j)= lon(trlon(1,i),clat(1,j));
        latitude(i,j)= lat(trlon(1,i),clat(1,j));
        
