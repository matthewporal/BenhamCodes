%   lh=findall(gcf,'type','line');
% if ~isempty(lh) % here superfluous
%      xd=get(lh,'xdata');
%      yd=get(lh,'ydata');
%      
% end

h=gcf;
axesObjs = get(h, 'Children');  %axes handles
dataObjs = get(axesObjs, 'Children'); %handles to low-level graphics objects in axes
objTypes = get(dataObjs, 'Type');  %type of low-level graphics object
%xdata = get(dataObjs(),'XData');