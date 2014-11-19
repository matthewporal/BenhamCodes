options = optimoptions('fsolve','Display','iter','Jacobian','on');
[x,F,exitflag,output,JAC] = fsolve(@Biology,M,options);