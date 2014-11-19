% figure(1);
% contourf(lat,lon,No');
% hold on
% figure(2);
% contourf(lat,lon,Po');
% figure(3);
% contourf(lat,lon,No');
% hold on;
m_proj('mercator','lon',[123 126.5],'lat',[15 18.45]);
m_tbase('contour',7,'edgecolor','k');
m_grid('linestyle','none','tickdir','out','linewidth',2);


