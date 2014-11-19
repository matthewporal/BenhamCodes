ystp=0.08;
xnum=499;
ynum=450;
for cycle = 0:maxcycle %time range of simulation
    for xn = 1:xnum
        for yn = 1:ynum
            if (xn==1 || xn==xnum || yn==1 || yn==ynum) %boundary condition is set to zero
                N(xn,yn) = 0;
            else
                N(xn,yn) = No(xn,yn)+timestep*kappa*... %x-component of diffusion
                    ( No(xn-1,yn)-2.0*No(xn,yn)+No(xn+1,yn) )/((lat(1,xn)-lat(1,xn-1))*(lat(1,xn)-lat(1,xn-1)));
                N(xn,yn) = No(xn,yn)+timestep*kappa*... %y-component of diffusion
                    ( No(xn,yn-1)-2.0*No(xn,yn)+No(xn,yn+1) )/(ystp*ystp);
                %Advective UPWIND scheme in X-direction 
                if (Vx(xn,xy)>0)
                    N(xn,yn)=N(xn,yn)-Vx(xn,yn)*timestep*(No(xn,yn)-No(xn-1,yn))/(lat(1,xn)-lat(1,xn-1));
                end
                if (VX(xn,yn)<0)
                    N(xn,yn)=N(xn,yn)-Vx(xn,yn)*timestep*(No(xn+1,yn)-No(xn,yn))/(lat(1,xn)-lat(1,xn-1));
                end

                %Advective UPWIND scheme in Y-direction
                if (Vy(xn,yn)>0)
                    N(xn,yn)=N(xn,yn)-Vy(xn,yn)*timestep*(No(xn,yn)-No(xn,yn-1))/ystp;
                end
                if (Vy(xn,yn)<0)
                    N(xn,yn)=N(xn,yn)-Vy(xn,yn)*timestep*(No(xn,yn+1)-No(xn,yn))/ystp;
                end
                %Nutrient gain due to zooplankton and phytoplankton mortality
                N(xn,yn)=N(xn,yn)+0.1*timestep*Po(xn,yn);
                N(xn,yn)=N(xn,yn)+0.3*timestep*(Zo(xn,yn));
                
                %Nutrient gain due to zooplankton grazing/ingestion
                N(xn,yn) = N(xn,yn)+0.5*timestep*exp(0.063*To(xn,yn))*daylength(lat(xn,yn),cycle)*...
                    (1-exp(-3*exp(0.063*To(xn,yn)))*Po(xn,yn)*Po(xn,yn))*Zo;
                
                %Nutrient loss due to phytoplankton nutrient intake
                N(xn,yn)= N(xn,yn)- timestep*exp(0.063*To(xn,yn))*daylength(lat(xn,yn),cycle)*...
                    (No(xn,yn)/(0.05*exp(-0.063*To(xn,yn))+No(xn,yn)))*Po(xn,yn);
            end
        end
    end
    No=N; %Reloading new initial conditions
end

                
               
             
              