[long, dep]=meshgrid(lon(1:450,1),1:33);
tempy = zeros(33,450);
for i = 1:33
    ttemp = temp(1:450,1,i);
    tempy(i,:)= ttemp';
end