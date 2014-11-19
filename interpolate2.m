load 'u.mat'
load 'v.mat'
load 'latitude.mat'
load 'longitude.mat'
load 'Tempy.mat'
load 'laty.mat'
load 'longy.mat'
% [laty,longy] = meshgrid(14.7929:0.044356:19.2285,122.8:0.044:127.2);
latsize = size(laty);
lonsize = size(longy);
uu3 = zeros(latsize(1,2),lonsize(1,1),8640);
vv3 = zeros(latsize(1,2),lonsize(1,1),8640);
TTempy3 = zeros(latsize(1,2),lonsize(1,1),8640);

for m = 1:8640
    uu3(:,:,m) = interp2(latitude,longitude,u(:,:,m + 17281),laty,longy,'spline');
    vv3(:,:,m) = interp2(latitude,longitude,v(:,:,m + 17281),laty,longy,'spline');
    TTempy3(:,:,m) = interp2(latitude,longitude,Tempy(:,:,m + 17281),laty,longy,'spline');
end


