lat = ncread('hycom_expt_91.1phil_2014-05-03.nc','Latitude');
lon = ncread('hycom_expt_91.1phil_2014-05-03.nc','Longitude');
tempo = ncread('hycom_expt_91.1phil_2014-05-2.nc', 'temperature'); 
temp = ncread('hycom_expt_91.1phil_2014-05-2.nc', 'temperature');
uvelo = ncread('hycom_expt_91.1phil_2014-05-2.nc', 'u');
uvel = ncread('hycom_expt_91.1phil_2014-05-2.nc', 'u');
vvelo = ncread('hycom_expt_91.1phil_2014-05-2.nc', 'v');
vvel = ncread('hycom_expt_91.1phil_2014-05-2.nc', 'v');
xvel = uvel(:,:,2);
yvel = vvel(:,:,2);
xvelo = uvelo(:,:,2);
yvelo = vvelo(:,:,2);
tempoy= temp(:,:,2);
tempoyy= tempo(:,:,2);
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
        xvelocity(i,j)= xvel(trlon(1,i),clat(1,j));
        yvelocity(i,j)= yvel(trlon(1,i),clat(1,j));
        xvo(i,j) = xvelo(trlon(1,i),clat(1,j));
        yvo(i,j) = yvelo(trlon(1,i),clat(1,j));
        temperature(i,j) = tempoy(trlon(1,i),clat(1,j));
        temperatureo(i,j) = tempoyy(trlon(1,i),clat(1,j));
    end
end
% To = temperature;
% U = xvelocity;
% V = yvelocity;
longy = longitude(:,1:50);
laty = latitude(:,1:50);
U = xvelocity(:,1:50);
V = yvelocity(:,1:50);
Uo = xvo(:,1:50);
Vo = yvo(:,1:50);
tempy = temperature(:,1:50);
tempyy = temperatureo(:,1:50);