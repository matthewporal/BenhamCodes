initial;
load('Vy.mat');
load('Vx.mat');
load('To.mat');
load('lon.mat');
load('lat.mat');
kappa=0;
timestep=1;
maxcycle=1;
ystp=0.08;
xnum=450;
ynum=499;
for cycle = 0:maxcycle %time range of simulation
    for xn = 1:xnum
        for yn = 1:ynum
            if (xn==1 || xn==xnum || yn==1 || yn==ynum) %boundary condition is set to zero
                Z(xn,yn) = 0;
            else
                Z(xn,yn) = Zo(xn,yn)+timestep*kappa*... %x-component of diffusion
                    ( Zo(xn-1,yn)-2.0*Zo(xn,yn)+Zo(xn+1,yn) )/((lat(1,xn)-lat(1,xn-1))*(lat(1,xn)-lat(1,xn-1)));
                Z(xn,yn) = Zo(xn,yn)+timestep*kappa*... %y-component of diffusion
                    ( Zo(xn,yn-1)-2.0*Zo(xn,yn)+Zo(xn,yn+1) )/(ystp*ystp);
                %Advective UPWIND scheme in X-direction 
                if (u(xn,yn)>0)
                    Z(xn,yn)=Z(xn,yn)-u(xn,yn)*86400*timestep*(Zo(xn,yn)-Zo(xn-1,yn))/(lat(1,xn)-lat(1,xn-1));
                end
                if (u(xn,yn)<0)
                    Z(xn,yn)=Z(xn,yn)-u(xn,yn)*86400*timestep*(Zo(xn+1,yn)-Zo(xn,yn))/(lat(1,xn)-lat(1,xn-1));
                end

                %Advective UPWIND scheme in Y-direction
                if (v(xn,yn)>0)
                    Z(xn,yn)=Z(xn,yn)-v(xn,yn)*86400*timestep*(Zo(xn,yn)-Zo(xn,yn-1))/ystp;
                end
                if (v(xn,yn)<0)
                    Z(xn,yn)=Z(xn,yn)-v(xn,yn)*86400*timestep*(Zo(xn,yn+1)-Zo(xn,yn))/ystp;
                end
                
                %Zooplankton mortality
                Z(xn,yn) = Z(xn,yn)-0.3*86400*timestep*(Zo(xn,yn));
                
                %Zooplankton grazing
                Z(xn,yn) = Z(xn,yn)+0.5*86400*timestep*exp(0.063*To(xn,yn))*daylength(lat(xn,yn),(cycle+1))*...
                    (1-(exp(-3*exp(0.063*To(xn,yn))))*Po(xn,yn)*Po(xn,yn))*Zo(xn,yn);
            end
        end
    end
    Zo=Z; %Reloading new initial conditions
end


            
                
          

            