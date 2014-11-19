%http://www.ldeo.columbia.edu/~agordon/Reports/LamonBay2011_Report.pdf

% A = [124.2498333 124.2523333 124.2498333 124.2501667 123.20665 123.6995...
%     121.7807667 121.7415 121.7201667 121.8293333 122.4995 122.9538333...
%     124.2248333 123.7505 123.2493333 122.75225 122.2509667 122.0003333...
%     122.74995 122.9993333 124.2498333];
% B = [18.35 17.2506667 14.7498333 14 15.7400333 15.23985 15.2748833 15.8168333...
%     14.9815 14.5211667 15.2018333 14.7903333 15.753 15.75055 15.7508333 15.7513667...
%     15.7502833 15.75 16.5006333 16.5016667 16.5001667];
xx = lon;
yy = lat;
aa = 20;
cc = othrflag+0.0001;
figure('Position',[100 50 900 700],'Renderer','zbuffer');
m_proj('UTM','lon',[123.5 125],'lat',[15.5 16.2]);
m_scatter(xx,yy,aa,cc,'filled');
m_grid('linestyle','none','tickdir','out','linewidth',3);
hold on
m_tbase('contour',12,'edgecolor','k','linewidth',0.5);
[cmin,cmax] = caxis;
caxis([0.00001,0.0011])
% hcb=colorbar;
% colormap(jet(100))
colorbar
% shading flat;
% m_quiver(lonnew,latnew,unew,vnew,3,'black');
% m_line(A,B...
%     ,'linewidth',1.5,'color','k','linestyle','-','marker','.','markeredgecolor','r','markersize',20)
% colormap(jet);
% h=colorbar;
% set(get(h,'Title'),'String','ug/L')
% m_text(124.372250, 15.578217, 'Transect 1', 'vertical', 'top');
% m_line([123.380150 123.518500 123.675033 123.797700 124.002450 124.179400],...
%     [16.119650  16.231817  16.334367  16.464200 16.575883  16.691350]...
%     ,'linewidth',2,'color','r','linestyle','-','marker','.','markersize',20)
% m_text(123.675033, 16.334367, 'Transect 2', 'vertical', 'top');

% rez=1200; %resolution (dpi) of final graphic
% f=gcf; %f is the handle of the figure you want to export
% figpos=getpixelposition(f); %dont need to change anything here
% resolution=get(0,'ScreenPixelsPerInch'); %dont need to change anything here
% set(f,'paperunits','inches','papersize',figpos(3:4)/resolution,'paperposition',[0 0 figpos(3:4)/resolution]); %dont need to change anything here
% path='C:\Users\Matthew\Desktop\Benham'; %the folder where you want to put the file
% name='dinoflagellate.png'; %what you want the file to be called
% print(f,fullfile(path,name),'-dpng',['-r',num2str(rez)],'-zbuffer') %save file 