% To plot a map
t1=2;
t2=18;
dp=2;
lna=121;
lnb=126.5;
lta=13.5;
ltb=18.45;

%Salinity plot with quiver from ADCP
for i=t1:t2
    date = datenum(2014, 5, i);
    m_pcolor(lon, lat, smat(:,:,dp,i));
    shading flat;
    m_proj('mercator', 'lon', [lna lnb], 'lat', [lta ltb]);
    m_grid;
    hold on;
    m_quiver(lon,lat,umat(:,:,dp,i),vmat(:,:,dp,i),70,'black');
    caxis([34,35]);
    colorbar;
    title(strcat('Salinity and Current ', datestr(date, ' dd mmm yyyy')), 'Fontsize', 18);
    xlabel(sprintf('Longitude (%cN)', char(176)),'Fontsize', 14);
    ylabel(sprintf('Latitude (%cE)', char(176)),'Fontsize', 14);
    m_plot(124+16.591/60, 15+48.316/60,'or','MarkerSize',7, 'linewidth', 7);
    figure()
    %saveas(figure,'Sal_May', 'jpg');
end

%Temperature plot
for j=t1:t2
    date = datenum(2014, 5, j);
    m_pcolor(lon, lat, tmat(:,:,dp,j));
    shading flat;
    m_proj('mercator', 'lon', [lna lnb], 'lat', [lta ltb]);
    m_grid;
    hold on;
    caxis([26.5,31]);
    colorbar;
    title(strcat('Temperature ', datestr(date, ' dd mmm yyyy')), 'Fontsize', 18);
    xlabel(sprintf('Longitude (%cN)', char(176)),'Fontsize', 14);
    ylabel(sprintf('Latitude (%cE)', char(176)),'Fontsize', 14);
    m_plot(124+16.591/60, 15+48.316/60,'or','MarkerSize',7, 'linewidth', 7);
    figure();
    %saveas(figure,'Temp_May', 'jpg');
end


%averaging data
t1p=4;
t2p=14;
for k=t1p:t2p
    smat_ave = mean(smat(:,:,dp,k));
%     m_pcolor(lon, lat, smat_ave);
%     shading flat;
%     m_proj('mercator', 'lon', [121.5 126], 'lat', [13.5 18.5]);
%     m_grid;
%     caxis([26.5,31]);
%     colorbar;
end

s = sprintf('45%c', char(176));
figure
hold on
xlabel(s)