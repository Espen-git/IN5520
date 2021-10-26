%% Load data
clear all;
files = dir('oblig2-matlab\*.mat');
folder_name = 'oblig2-matlab\';
for i=1:length(files)
    load(append('oblig2-matlab\', string(files(i).name)));
end

%%
figure;
imshow(mosaic1_train,[]);

%% Plot glcms
close all;
% dx=1, dy=0
figure;
subplot(2,2,1);
heatmap(texture1dx1dy0);
title('Texture 1');
subplot(2,2,2);
heatmap(texture2dx1dy0);
title('Texture 2');
subplot(2,2,3);
heatmap(texture3dx1dy0);
title('Texture 3');
subplot(2,2,4);
heatmap(texture4dx1dy0);
title('Texture 4');
sgtitle('dx=1, dy=0')
colormap hot

% dx=0, dy=-1
figure;
subplot(2,2,1);
heatmap(texture1dx0dymin1);
title('Texture 1');
subplot(2,2,2);
heatmap(texture2dx0dymin1);
title('Texture 2');
subplot(2,2,3);
heatmap(texture3dx0dymin1);
title('Texture 3');
subplot(2,2,4);
heatmap(texture4dx0dymin1);
title('Texture 4');
sgtitle('dx=0, dy=-1')
colormap hot

% dx=1, dy=-1
figure;
subplot(2,2,1);
heatmap(texture1dx1dymin1);
title('Texture 1');
subplot(2,2,2);
heatmap(texture2dx1dymin1);
title('Texture 2');
subplot(2,2,3);
heatmap(texture3dx1dymin1);
title('Texture 3');
subplot(2,2,4);
heatmap(texture4dx1dymin1);
title('Texture 4');
sgtitle('dx=1, dy=-1')
colormap hot

% dx=-1, dy=-1
figure;
subplot(2,2,1);
heatmap(texture1dxmin1dymin1);
title('Texture 1');
subplot(2,2,2);
heatmap(texture2dxmin1dymin1);
title('Texture 2');
subplot(2,2,3);
heatmap(texture3dxmin1dymin1);
title('Texture 3');
subplot(2,2,4);
heatmap(texture4dxmin1dymin1);
title('Texture 4');
sgtitle('dx=-1, dy=-1')
colormap hot