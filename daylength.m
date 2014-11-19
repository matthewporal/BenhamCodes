function  Delta_d=daylength(latitude,t)
% Calculation of the length of the day 
% based on astronomical formulas
% ----------------------------------------------
%
% global latitude;
lat=latitude*2*pi/360;    
% Inclination seasonally varying angle between 
% the equatorial plane and the sun
% Fourier series (Spencer)
A=[.006918 -.399912 -.006758 -.002697];
B=[.070257 .000907 .001480];
%
% Zenith angle zeta
%
G=2*pi/365*t;
inc=A(1)+A(2)*cos(G)+A(3)*cos(2*G)+A(4)*cos(3*G);
inc=inc+B(1)*sin(G)+B(2)*sin(2*G)+B(3)*sin(3*G);
%
% length of the day
Delta_d=24/pi*acos(-sin(lat)*sin(inc)/cos(lat)./cos(inc)); %in hours
Delta_d=Delta_d/24; % normalized
