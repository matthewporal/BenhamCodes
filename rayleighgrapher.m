for jj = [5 6 8 10 12]
    data = xlsread(['control.xlsx','B2_' num2str(jj) 'dph']);

ss = size(data);
sr = ss(1,1);
sc = ss(1,2);

for ii = 1:sc
    a = data(1:sr,3 + 4*(ii-1));
x = data(1:sr,1 + 4*(ii-1));
y = data(1:sr,2 + 4*(ii-1));

s = size(a);

for i=1:s(1,1)
    if x(i,1)> 0 && y(i,1)> 0
        rad(i,1) = degtorad(abs(a(i,1)));
    elseif x(i,1)< 0 && y(i,1)> 0
        rad(i,1) = degtorad(180 - abs(a(i,1)));
    elseif x(i,1)<0 && y(i,1)< 0
        rad(i,1) = degtorad(180 + abs(a(i,1)));
    else
        rad(i,1) = degtorad(360 - abs(a(i,1)));
    end
end
    
r = rose2(rad,24);
xxx = xlim;
hold on 
h = polar(rad, xxx(1,2)*ones(size(rad)),'ob');
set(h,'MarkerFaceColor','b')
set(h,'MarkerSize',4)
end
end
