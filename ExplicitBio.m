%initial conditions based on the equilibrium solution
Nx= 101; %length of x-axis (longitude)
Ny= 101; %length of y-axis (latitude)
uo= 0.7;% phytoplankton uptake
kso= 0.1; %saturation rate of phytoplankton
Nt = 3; %total biomass 
dp = 0.016; %mortality rate of phytoplankton
go = 0.1; %zooplankton grazing
a = 0.8; %assimilation efficiency
dz = 0.08; %mortality rate of zooplankton
vo = 0.1; %ivlev factor
dt = 1/1440; %time step
d = 2; %minutes
load('TTempy.mat')
tempy = TTempy(:,:,d);
clear TTempy

for i=1:Ny
    for j=1:Nx
        u = uo*exp(0.063*0.5*tempy(i,j));
        ks = kso*exp(-0.063*0.5*tempy(i,j));
        g = go*exp(0.063*0.5*tempy(i,j));
        v = vo*exp(0.063*0.5*tempy(i,j));
        M1(i,j) = Mo1(i,j)+ dt*((-1*u*(Mo1(Nx+i,j)*Mo1(i,j))/(Mo1(i,j)+ks)) + dp*Mo1(Nx+i,j) + dz*Mo1(2*Nx+i,j)+...
            (1-a)*(g/v)*Mo1(2*Nx+i,j)*(1-exp(-1*v*Mo1(Nx+i,j))));
        M1(Nx+i,j)= Mo1(Nx+i,j)+ dt*((u*(Mo1(Nx+i,j)*Mo1(i,j))/(Mo1(i,j)+ks)) - dp*Mo1(Nx+i,j) -...
            (g/v)*Mo1(2*Nx+i,j)*(1-exp(-1*v*Mo1(Nx+i,j))));
        M1(2*Nx+i,j) = Mo1(2*Nx+i,j)+ dt*(a*(g/v)*Mo1(2*Nx+i,j)*(1-exp(-1*v*Mo1(Nx+i,j))) - dz*Mo1(2*Nx+i,j));
    end 
end

clearvars -except M1 Mo1
