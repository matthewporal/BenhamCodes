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
d = 1; %minutes
load('TTempy.mat')
tempy = TTempy(:,:,d);
clear TTempy

for i=1:Ny
    for j=1:Nx
        u = uo*exp(0.063*tempy(i,j,d));
        ks = kso*exp(-0.063*tempy(i,j,d));
        g = go*exp(0.063*tempy(i,j,d));
        v = vo*exp(0.063*tempy(i,j,d));
        yetav = (log(1-(dz*v/a*g)))/v;
        rho = 0.5*(ks + Nt + yetav*(1 + (a/dz)*(dp-u)));
        s = (a/dz)*yetav*(dp*(yetav+Nt+ks)-u*(yetav+Nt));
        Po(i,j) = -1*yetav;
        Zo(i,j) = rho - sqrt((rho*rho)-s);
        No(i,j) = Nt + yetav - rho + sqrt((rho*rho)-s);
    end
end
        
Mo1 = cat(1,No,Po,Zo);
clearvars -except Mo1

        
        
    
             

        
       
        
        
        
    

