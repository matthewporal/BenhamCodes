function Nv = Diffuse(mat,Uo,UU,U,Vo,VV,V)
% mat is the initial/previous values
% U is the x-velocity at the final time step
% UU is the x-velocity at the half-time step
% Uo is the initial x-velocity
% V is the y-velocity at the final time step
% VV is the y-velocity at the half-time step
% Vo is the initial y-velocity 
% mat is the initial/previous time step values
dx = 4736.745349870635; % interval of longitude in meters
dy = 4907.190566378487; % interval of latitude in meters
dt = 2; % time interval in minutes
Nx = 101; % length of the longitude axis
Ny = 101; % length of the latitude axis
a = (dt/2)/(12*dx); 
b = (dt/2)/(12*dy);

