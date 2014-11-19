for d = 2:19
    uvel = ncread(['hycom_expt_91.1phil_2014-05-' num2str(d) '.nc'], 'u');
    uuvel = uvel(:,:,2);
    umat(:,:,d-1) = uuvel;
    vvel = ncread(['hycom_expt_91.1phil_2014-05-' num2str(d) '.nc'], 'v');
    vvvel = vvel(:,:,2);
    vmat(:,:,d-1) = vvvel;
    temp = ncread(['hycom_expt_91.1phil_2014-05-' num2str(d) '.nc'], 'temperature');
    ttemp = temp(:,:,2);
    tmat(:,:,d-1) = ttemp;
end
    

lat = ncread('hycom_expt_91.1phil_2014-05-03.nc','Latitude');
lon = ncread('hycom_expt_91.1phil_2014-05-03.nc','Longitude');
latnew = lat(1,1:499);
lonnew = lon(1:450,1);
[rlat,clat,vlat] = find(latnew>=14.75 & latnew<=19.25);
[rlon,clon,vlon] = find(lonnew>=122.75 & lonnew<=127.25);
trlon = rlon';
lonsize = size(trlon);
latsize = size(clat);
r = 1:18;
rr = 1:17/25920:18;

for k=1:18
    for i = 1:lonsize(1,2)
        for j = 1:latsize(1,2)
            longitude(i,j)= lon(trlon(1,i),clat(1,j));
            latitude(i,j)= lat(trlon(1,i),clat(1,j));
            xvelocity(i,j,k)= umat(trlon(1,i),clat(1,j),k);
            yvelocity(i,j,k)= vmat(trlon(1,i),clat(1,j),k);
            temperature(i,j,k)= tmat(trlon(1,i),clat(1,j),k);
        end
    end
end

for i = 1:lonsize(1,2)
    for j = 1:latsize(1,2)
        for k = 1:18
            x(k) = xvelocity(i,j,k);
            y(k) = yvelocity(i,j,k);
            t(k) = temperature(i,j,k);
        end
            xx = spline(r,x,rr);
            yy = spline(r,y,rr);
            tt = spline(r,t,rr);
            xsize = size(xx);
            for m = 1:xsize(1,2)
                u(i,j,m) = xx(m);
                v(i,j,m) = yy(m);
                Tempy(i,j,m) = tt(m);
            end
    end
end

% usize = size(u);
% uu = zeros(usize(1,1),usize(1,2),usize(1,3));
% vv = zeros(usize(1,1),usize(1,2),usize(1,3));
% TTempy = zeros(usize(1,1),usize(1,2),usize(1,3));
% [longy,laty] = meshgrid(122.8:55/100:127.2,14.7929:58/100:19.2285);
% 
% for m = 1:25921
%     uu(:,:,m) = interp2(longitude',latitude',u(:,:,m),longy,laty);
%     vv(:,:,m) = interp2(longitude',latitude',v(:,:,m),longy,laty);
%     TTempy(:,:,m) = interp2(longitude',latitude',Tempy(:,:,m),longy,laty);
% end
    
    


            


            


    