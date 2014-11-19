xo = [1; 1; 1; 1];
options = optimoptions('fsolve','Display','iter');
x= fsolve(@coeff,xo,options);