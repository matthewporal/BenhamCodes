rez=1200; %resolution (dpi) of final graphic
f=gcf; %f is the handle of the figure you want to export
figpos=getpixelposition(f); %dont need to change anything here
resolution=get(0,'ScreenPixelsPerInch'); %dont need to change anything here
set(f,'paperunits','inches','papersize',figpos(3:4)/resolution,'paperposition',[0 0 figpos(3:4)/resolution]); %dont need to change anything here
path='C:\Users\Matthew\Desktop\Benham'; %the folder where you want to put the file
name='Pgraph'; %what you want the file to be called
print(f,fullfile(path,name),'-djpeg',['-r',num2str(rez)],'-zbuffer') 
%save file, change -djpeg to -dpng if you want to save it in png format,
%-dtiff if you want to save it in tiff format and so on and so forth...