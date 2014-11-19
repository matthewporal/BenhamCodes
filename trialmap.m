m_proj('mercator','lon',[122.8 127.2],'lat',[14.7929 19.2285]);
m_pcolor(longy(1:50,1:50),laty(1:50,1:50),N4);
[cmin,cmax] = caxis;
caxis([0.6882,11.6189])
shading flat
hold on
m_tbase('contour',10,'edgecolor','k','linewidth',1.5);
m_grid('linestyle','none','tickdir','out','linewidth',2);