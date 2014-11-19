ystp=0.08;
xnum=499;
ynum=450;
for cycle = 0:maxcycle %time range of simulation
    for xn = 1:xnum
        for yn = 1:ynum
            if (xn==1 || xn==xnum || yn==1 || yn==ynum) %boundary condition is set to zero
                P(xn,yn) = 0;
            else
                P(xn,yn) = Po(xn,yn)+timestep*kappa*... %x-component of diffusion
                    ( Po(xn-1,yn)-2.0*Po(xn,yn)+Po(xn+1,yn) )/((lat(1,xn)-lat(1,xn-1))*(lat(1,xn)-lat(1,xn-1)));
                P(xn,yn) = P(xn,yn)+timestep*kappa*... %y-component of diffusion
                    ( Po(xn,yn-1)-2.0*Po(xn,yn)+Po(xn,yn+1) )/(ystp*ystp);
                %Advective UPWIND scheme in X-direction 
                if (Vx(xn,xy)>0)
                    P(xn,yn)=P(xn,yn)-Vx(xn,yn,cycle+1)*timestep*(Po(xn,yn)-Po(xn-1,yn))/(lat(1,xn)-lat(1,xn-1));
                end
                if (VX(xn,yn)<0)
                    P(xn,yn)=P(xn,yn)-Vx(xn,yn,cycle+1)*timestep*(Po(xn+1,yn)-Po(xn,yn))/(lat(1,xn)-lat(1,xn-1));
                end

                %Advective UPWIND scheme in Y-direction
                if (Vy(xn,yn)>0)
                    P(xn,yn)=P(xn,yn)-Vy(xn,yn,cycle+1)*timestep*(Po(xn,yn)-Po(xn,yn-1))/ystp;
                end
                if (Vy(xn,yn)<0)
                    P(xn,yn)=P(xn,yn)-Vy(xn,yn,cycle+1)*timestep*(Po(xn,yn+1)-Po(xn,yn))/ystp;
                end
                
                %Phytoplankton nutrient uptake
                P(xn,yn)= P(xn,yn)+ timestep*exp(0.063*To(xn,yn))*daylength(lat(xn,yn),cycle)*...
                    (No(xn,yn)/(0.05*exp(-0.063*To(xn,yn))+No(xn,yn)))*Po(xn,yn);
                
                %Phytoplankton loss due to zooplankton grazing/ingestion
                P(xn,yn)= P(xn,yn) - 0.5*timestep*exp(0.063*To(xn,yn))*daylength(lat(xn,yn),cycle)*...
                    (1-exp(-3*exp(0.063*To(xn,yn)))*Po(xn,yn)*Po(xn,yn))*Zo;
                
                %Phytoplankton mortality
                P(xn,yn)=P(xn,yn)-0.1*timestep*Po(xn,yn);
            end
        end
    end
    Po=P; %Reloading new initial conditions
end
