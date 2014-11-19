function [F,J] = Biology(M)
global tempyy
global Mo

%initial conditions based on the equilibrium solution
Nx= 50; %length of x-axis (longitude)(101)
Ny= 50; %length of y-axis (latitude)(101)
uo= 0.7;% phytoplankton uptake
kso= 0.1; %saturation rate of phytoplankton
Nt = 3; %total biomass 
dp = 0.016; %mortality rate of phytoplankton
go = 0.1; %zooplankton grazing
a = 0.8; %assimilation efficiency
dz = 0.08; %mortality rate of zooplankton
vo = 0.1; %ivlev factor
dt = 1/1440; %time step
F = zeros(3*Nx,Ny);

for i=1:Ny
    for j=1:Nx
        u = uo*exp(0.063*tempyy(i,j));
        ks = kso*exp(-0.063*tempyy(i,j));
        g = go*exp(0.063*tempyy(i,j));
        v = vo*exp(0.063*tempyy(i,j));
        F(i,j) = Mo(i,j)-M(i,j)+ dt*((-1*u*(M(Nx+i,j)*M(i,j))/(M(i,j)+ks)) + dp*M(Nx+i,j) + dz*M(2*Nx+i,j)+...
            (1-a)*(g/v)*M(2*Nx+i,j)*(1-exp(-1*v*M(Nx+i,j))));
        F(Nx+i,j)= Mo(Nx+i,j)-M(Nx+i,j)+ dt*((u*(M(Nx+i,j)*M(i,j))/(M(i,j)+ks)) - dp*M(Nx+i,j) -...
            (g/v)*M(2*Nx+i,j)*(1-exp(-1*v*M(Nx+i,j))));
        F(2*Nx+i,j) = Mo(2*Nx+i,j)-M(2*Nx+i,j)+ dt*(a*(g/v)*M(2*Nx+i,j)*(1-exp(-1*v*M(Nx+i,j))) ...
            - dz*M(2*Nx+i,j));
    end 
end

if nargout > 1
    for i = Nx
        for j = Ny
            u = uo*exp(0.063*tempyy(i,j));
            ks = kso*exp(-0.063*tempyy(i,j));
            g = go*exp(0.063*tempyy(i,j));
            v = vo*exp(0.063*tempyy(i,j));
            d1F(i,j) = -1 - (dt*-u*M(Nx+i,j))/(M(i,j)+ks) + (dt*u*M(Nx+1,j)*M(i,j))/((M(i,j)+ks)^2);
            d2F(i,j) = (-1*dt*u*M(i,j))/(M(i,j) + ks) + dt*dp + dt*v*(1-a)*(g/v)*M(2*Nx+1,j)*(exp(-v*M(Nx+i,j)));
            d3F(i,j) = dz*dt + (1-a)*(g/v)*dt*(1-exp(-v*M(Nx+i,j)));
            d4F(i,j) = (dt*u*M(Nx+i,j))/(M(i,j) + ks) - (dt*u*M(Nx+i,j)*M(i,j))/((M(i,j)+ks)^2);
            d5F(i,j) = -1 + (dt*u*M(i,j))/(M(i,j)+ks) - dp*dt - v*dt*(g/v)*M(2*Nx+i,j)*exp(-v*M(Nx+i,j));
            d6F(i,j) = (-g/v)*dt*(1-exp(-v*M(Nx+i,j)));
            d7F(i,j) = dt*a*(g/v)*M(2*Nx+i,j)*exp(-v*M(Nx+i,j));
            d8F(i,j) = -1 - dt*dz + dt*a*(g/v)*(1-exp(-v*M(Nx+i,j)));
        end
    end
    
    %A = 1:3*Nx*Nx;
%     J = sparse(1,1,0,3*Nx*Nx,3*Nx*Nx);
    for j = 1:Nx
        S1 = sparse((j-1)*3*Nx+1:(j-1)*3*Nx+Nx,(j-1)*3*Nx+1:(j-1)*3*Nx+Nx,...
            d1F(1:Nx,j)',3*Nx*Nx,3*Nx*Nx);
        S2 = sparse((j-1)*3*Nx+1:(j-1)*3*Nx+Nx,(j-1)*3*Nx+Nx+1:(j-1)*3*Nx+2*Nx,...
            d2F(1:Nx,j)',3*Nx*Nx,3*Nx*Nx);
        S3 = sparse((j-1)*3*Nx+1:(j-1)*3*Nx+Nx,(j-1)*3*Nx+2*Nx+1:(j-1)*3*Nx+3*Nx,...
            d3F(1:Nx,j)',3*Nx*Nx,3*Nx*Nx);
        S4 = sparse((j-1)*3*Nx+Nx+1:(j-1)*3*Nx+2*Nx,(j-1)*3*Nx+1:(j-1)*3*Nx+Nx,...
            d4F(1:Nx,j)',3*Nx*Nx,3*Nx*Nx);
        S5 = sparse((j-1)*3*Nx+Nx+1:(j-1)*3*Nx+2*Nx,(j-1)*3*Nx+Nx+1:(j-1)*3*Nx+2*Nx,...
            d5F(1:Nx,j)',3*Nx*Nx,3*Nx*Nx);
        S6 = sparse((j-1)*3*Nx+Nx+1:(j-1)*3*Nx+2*Nx,(j-1)*3*Nx+2*Nx+1:(j-1)*3*Nx+3*Nx,...
            d6F(1:Nx,j)',3*Nx*Nx,3*Nx*Nx);  
        S7 = sparse((j-1)*3*Nx+2*Nx+1:(j-1)*3*Nx+3*Nx,(j-1)*3*Nx+Nx+1:(j-1)*3*Nx+2*Nx,...
           d7F(1:Nx,j)',3*Nx*Nx,3*Nx*Nx);
        S8 = sparse((j-1)*3*Nx+2*Nx+1:(j-1)*3*Nx+3*Nx,(j-1)*3*Nx+2*Nx+1:(j-1)*3*Nx+3*Nx,...
           d8F(1:Nx,j)',3*Nx*Nx,3*Nx*Nx);
   end 
   J = S1+S2+S3+S4+S5+S6+S7+S8;
end
       
    
    
       
    
        
     
    
        
        
        