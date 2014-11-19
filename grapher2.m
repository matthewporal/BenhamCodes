function grapher2(M1,M2,longy,laty)
figure(1)
m_proj('mercator','lon',[123.04 126.96],'lat',[15.0248 18.7747]);
m_pcolor(longy,laty,PP);
[cmin,cmax] = caxis;
shading flat
hold on
m_tbase('contourf',8,'edgecolor','k','linewidth',1.25);
m_grid('linestyle','none','tickdir','out','linewidth',3);
caxis([cmin,cmax])
colormap(jet);
figure(2)
m_proj('mercator','lon',[123.04 126.96],'lat',[15.0248 18.7747]);
m_pcolor(longy,laty,M2);
[cmin,cmax] = caxis;
shading flat
hold on
m_tbase('contourf',8,'edgecolor','k','linewidth',1.25);
%m_quiver(longy,laty,(0.5*U),(0.5*V),2.75,'color','k');
m_grid('linestyle','none','tickdir','out','linewidth',3);
caxis([cmin,cmax])
colormap(jet);

%m_tbase('contour',5,'edgecolor','k','linewidth',2);
% m_quiver(longitude,latitude,xvelocity,yvelocity,2.75,'color','k');
% m_grid('linestyle','none','tickdir','out','linewidth',2);
% colormap(jet);
% figure(3)
% m_proj('mercator','lon',[123.05 126.5],'lat',[15 18.45]);
% m_pcolor(longitude,latitude,Zo);
% shading flat
% hold on
%m_tbase('contour',5,'edgecolor','k','linewidth',2);
%m_quiver(longitude,latitude,xvelocity,yvelocity,2.75,'color','k');
% m_proj('mercator','lon',[123.05 126.5],'lat',[15 18.45]);
% m_pcolor(longy,laty,tempy);
% shading interp;
% m_grid('linestyle','none','tickdir','out','linewidth',2);
% hold on
% vel = surf(longitude, latitude,xvelocity);
% shading flat
% set(vel,'edgecolor','none');
% view(2);