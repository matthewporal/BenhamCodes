for day = 3:19
    [longy,laty,U,V,Uo,Vo,tempy,tempyy] = rescale(day);
    load(['N' num2str(day-2) '.mat'])
    load(['P' num2str(day-2) '.mat'])
    load(['Z' num2str(day-2) '.mat'])
    Mo = cat(1,N,P,Z);
    ExplicitBio
    N11 = M(1:50,:);
    P11 = M(51:100,:);
    Z11 = M(101:150,:);
    N = CrankNicholson(N11,U,V,Uo,Vo);
    P = CrankNicholson(P11,U,V,Uo,Vo);
    Z = CrankNicholson(Z11,U,V,Uo,Vo);
    save(['N' num2str(day-1) '.mat'],'N')
    save(['P' num2str(day-1) '.mat'],'P')
    save(['Z' num2str(day-1) '.mat'],'Z')
end
