load No.mat
load N1.mat
load N2.mat
load N3.mat
load N4.mat
load N5.mat
load N6.mat


NN = zeros(50,50,6);
NN(:,:,1)=No(50,50);
NN(:,:,2)=N1;
NN(:,:,3)=N2;
NN(:,:,4)=N3;
NN(:,:,5)=N4;
NN(:,:,6)=N5;
NN(:,:,7)=N6;

figure('Position',[100 50 900 700],'Renderer','zbuffer');
for j = 1:7
    m_proj('mercator','lon',[123.04004 126.95996],'lat',[15.024800 18.774700]);
    m_tbase('contour',8,'edgecolor','k','linewidth',2);  
    hold on     
    m_pcolor(longy,laty,NN(:,:,j));
    shading flat
    NNN = NN(:,:,j);
    m_grid('linestyle','none','tickdir','out','linewidth',3);
    [cmin,cmax] = caxis;
    caxis([min(NNN(:)),max(NNN(:))+0.00001])
    colormap(jet);
    colorbar;
    F(j) = getframe;
end

% figure('Position',[100 50 900 700],'Renderer','zbuffer');
% m_proj('mercator','lon',[123.04004 126.95996],'lat',[15.024800 18.774700]);
% shading flat
% hold on
% m_grid('linestyle','none','tickdir','out','linewidth',2);
% colormap(jet);
% colorbar;
movie(F,60,2) % Play the movie sixty times