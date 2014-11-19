xnum=499;
ynum=450;
for xn = 1:xnum
for yn = 1:ynum 
if (xn >= 387 && xn <= 390 && yn >= 310 && yn <= 322)
Po(xn,yn)=0.84; % Initial Phytoplankton Biomass
Zo(xn,yn)=0.4; % Initial Zooplankton Biomass
No(xn,yn)=3; % Initial Nutrients
elseif (xn >= 396 && xn <= 400 && yn >= 307 && yn <= 313)
Po(xn,yn)=1.3; % Initial Phytoplankton Biomass
Zo(xn,yn)=0.4; % Initial Zooplankton Biomass
No(xn,yn)=3; % Initial Nutrients
else
    Po(xn,yn)=0.001;
    Zo(xn,yn)=0.001;
    No(xn,yn)=0.001;
end
end
end
Po=Po';
Zo=Zo';
No=No';
