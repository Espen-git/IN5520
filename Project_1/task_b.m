%% Import pictures
mosaic1 = imread('mosaic1.png');
mosaic2 = imread('mosaic2.png');

%% Show pictures
figure, imshow(mosaic1);
figure, imshow(mosaic2);

%% Create subimages
d = length(mosaic1) / 2;

tl_1 = mosaic1(1:d, 1:d); 
tr_1 = mosaic1(1:d, d+1:end);
bl_1 = mosaic1(d+1:end, 1:d);
br_1 = mosaic1(d+1:end, d+1:end);

tl_2 = mosaic2(1:d, 1:d); 
tr_2 = mosaic2(1:d, d+1:end);
bl_2 = mosaic2(d+1:end, 1:d);
br_2 = mosaic2(d+1:end, d+1:end);

% Puting all subimages in one 3D matrix for convenience
subimages = tl_1;
subimages(:,:,2) = tr_1;
subimages(:,:,3) = bl_1;
subimages(:,:,4) = br_1;
subimages(:,:,5) = tl_2;
subimages(:,:,6) = tr_2;
subimages(:,:,7) = bl_2;
subimages(:,:,8) = br_2;

for i = 1:8
    %figure, imshow(subimages(:,:,i));
end

%% Histograms
figure();
for i = 1:8
    subplot(2,4,i), imhist(subimages(:,:,i));
    title(append('Subimage: ', num2str(i)));
end

%% Histogram equalized
subimages_eq = histeq(tl_1);
for i = 2:8
    subimages_eq(:,:,i) = histeq(subimages(:,:,i));
end

%% Show equalized subimages
figure();
for i = 1:8
    subplot(2,4,i), imshow(subimages_eq(:,:,i));
    title(append('Subimage: ', num2str(i)));
end

%% GLCMs
N = 16; % Number of gray levels
flag = hot;

%% Subimage: 1
figure();
%m = [6,7,8,9];
for i = 1:4
    paramaters = i*[0 1; -1 1; -1 0; -1 -1]; % 0, 45, 90 and 135 degrees.
    subplot(2,2,i);
    glcm1 = graycomatrix(subimages_eq(:,:,1), 'Numlevels', N, 'Offset', paramaters, 'Symmetric', true);
    glcm1 = fix(sum(glcm1, 3) / length(paramaters)); % average of glcm for different offstes
    glcm_normalized1 = glcm1./(sum(glcm1, 'all'));
    h = heatmap(string(0:N-1), string(0:N-1), glcm_normalized1);
    title(append('Step length: ', num2str(i)));
    h.Colormap = flag;
end

%% Subimage: 2
figure();
for i = 1:4
    paramaters = i*[0 1; -1 0]; % 0 and 90 degrees.
    subplot(2,2,i);
    glcm2 = graycomatrix(subimages_eq(:,:,2), 'Numlevels', N, 'Offset', paramaters, 'Symmetric', true);
    glcm2 = fix(sum(glcm2, 3) / length(paramaters)); % average of glcm for different offstes
    glcm_normalized2 = glcm2./(sum(glcm2, 'all'));
    h = heatmap(string(0:N-1), string(0:N-1), glcm_normalized2);
    title(append('Step length: ', num2str(i)));
    h.Colormap = flag;
end

%% Subimage: 3 
figure();
for i = 1:4
    paramaters = i*[1 3]; % about 18 degrees.
    subplot(2,2,i);
    glcm3 = graycomatrix(subimages_eq(:,:,3), 'Numlevels', N, 'Offset', paramaters, 'Symmetric', true);
    glcm3 = fix(sum(glcm3, 3) / length(paramaters)); % average of glcm for different offstes
    glcm_normalized3 = glcm3./(sum(glcm3, 'all'));
    h = heatmap(string(0:N-1), string(0:N-1), glcm_normalized3);
    title(append('Step length: ', num2str(i)));
    h.Colormap = flag;
end

%% Subimage: 4
figure();
for i = 1:4
    paramaters = i*[0 1; -1 1; -1 0; -1 -1]; % 0, 45, 90 and 135 degrees.
    subplot(2,2,i);
    glcm4 = graycomatrix(subimages_eq(:,:,4), 'Numlevels', N, 'Offset', paramaters, 'Symmetric', true);
    glcm4 = fix(sum(glcm4, 3) / length(paramaters)); % average of glcm for different offstes
    glcm_normalized4 = glcm4./(sum(glcm4, 'all'));
    h = heatmap(string(0:N-1), string(0:N-1), glcm_normalized4);
    title(append('Step length: ', num2str(i)));
    h.Colormap = flag;
end

%% Subimage: 5
figure();
for i = 1:4
    paramaters = i*[-1 1; 1 1]; % 45 and -45 degrees.
    subplot(2,2,i);
    glcm5 = graycomatrix(subimages_eq(:,:,5), 'Numlevels', N, 'Offset', paramaters, 'Symmetric', true);
    glcm5 = fix(sum(glcm5, 3) / length(paramaters)); % average of glcm for different offstes
    glcm_normalized5 = glcm5./(sum(glcm5, 'all'));
    h = heatmap(string(0:N-1), string(0:N-1), glcm_normalized5);
    title(append('Step length: ', num2str(i)));
    h.Colormap = flag;
end

%% Subimage: 6
figure();
m = [3,4,5,6]
for i = 1:4
    paramaters = m(i)*[0 1; -1 0]; % 0 and 90 degrees.
    subplot(2,2,i);
    glcm6 = graycomatrix(subimages_eq(:,:,6), 'Numlevels', N, 'Offset', paramaters, 'Symmetric', true);
    glcm6 = fix(sum(glcm6, 3) / length(paramaters)); % average of glcm for different offstes
    glcm_normalized6 = glcm6./(sum(glcm6, 'all'));
    h = heatmap(string(0:N-1), string(0:N-1), glcm_normalized6);
    title(append('Step length: ', num2str(i)));
    h.Colormap = flag;
end

%% Subimage: 7
figure();
m = [2,3,4,5]
for i = 1:4
    paramaters = m(i)*[0 1]; % 0 degrees.
    subplot(2,2,i);
    glcm7 = graycomatrix(subimages_eq(:,:,7), 'Numlevels', N, 'Offset', paramaters, 'Symmetric', true);
    glcm7 = fix(sum(glcm7, 3) / length(paramaters)); % average of glcm for different offstes
    glcm_normalized7 = glcm7./(sum(glcm7, 'all'));
    h = heatmap(string(0:N-1), string(0:N-1), glcm_normalized7);
    title(append('Step length: ', num2str(i)));
    h.Colormap = flag;
end

%% Subimage: 8
figure();
for i = 1:4
    paramaters = i*[0 1; -1 1; -1 0; -1 -1]; % 0, 45, 90 and 135 degrees.
    subplot(2,2,i);
    glcm8 = graycomatrix(subimages_eq(:,:,8), 'Numlevels', N, 'Offset', paramaters, 'Symmetric', true);
    glcm8 = fix(sum(glcm8, 3) / length(paramaters)); % average of glcm for different offstes
    glcm_normalized8 = glcm8./(sum(glcm8, 'all'));
    h = heatmap(string(0:N-1), string(0:N-1), glcm_normalized8);
    title(append('Step length: ', num2str(i)));
    h.Colormap = flag;
end
