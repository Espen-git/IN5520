%% Import pictures
clear all;
mosaic1 = imread('mosaic1.png');
mosaic2 = imread('mosaic2.png');

%% Pad images
window_size = 31;
d = (window_size-1)/2;

mosaic1_eq = histeq(mosaic1);
mosaic2_eq = histeq(mosaic2);
%figure, imshow(mosaic1_eq);
%figure, imshow(mosaic2_eq);
p_mosaic1 = padarray(mosaic1_eq,[d d],'symmetric','both');
p_mosaic2 = padarray(mosaic2_eq,[d d],'symmetric','both');
%figure, imshow(p_mosaic1);
%figure, imshow(p_mosaic2);

%%
G = 16;
img = p_mosaic1;

%% Compute glcm for mosaic1 [2 6]
glcms = zeros(G, G);
paramaters = [2 6];
p = 1;
for i = 1:length(mosaic1)
    for j = 1:length(mosaic1)
        window = img(i:i+(2*d),j:j+(2*d));
        glcms(:,:,p) = graycomatrix(window, 'NumLevels', G, 'Offset', paramaters, 'Symmetric', true);
        p = p + 1;
    end
end

%% Create feature images
[IDM11 INR11 SHD11] = featureimages(glcms, size(mosaic1));
%%
figure,
subplot(2,2,1), imshow(IDM11, []);
title('IDM [2 6] mosaic1');
subplot(2,2,2), imshow(INR11, []);
title('INR [2 6] mosaic1');
subplot(2,2,3), imshow(SHD11, []);
title('SHD [2 6] mosaic1');
saveas(gcf,'m1[26].png');

%% Compute glcm for mosaic1 [0 1; 1 0]
glcms = zeros(G, G);
paramaters = [0 1; 1 0];
p = 1;
for i = 1:length(mosaic1)
    for j = 1:length(mosaic1)
        window = img(i:i+(2*d),j:j+(2*d));
        glcm = graycomatrix(window, 'NumLevels', G, 'Offset', paramaters, 'Symmetric', true);
        glcm = fix(sum(glcm, 3) / length(paramaters)); % average of glcm for different offstes
        glcms(:,:,p) = glcm;
        p = p + 1;
    end
end

%% Create feature images
[IDM12 INR12 SHD12] = featureimages(glcms, size(mosaic1));
%%
figure,
subplot(2,2,1), imshow(IDM12, []);
title('IDM [0 1; 1 0] mosaic1');
subplot(2,2,2), imshow(INR12, []);
title('INR [0 1; 1 0] mosaic1');
subplot(2,2,3), imshow(SHD12, []);
title('SHD [0 1; 1 0] mosaic1');
saveas(gcf,'m1[01;10].png');

%% Compute glcm for mosaic1 isotropic with step length 6
glcms = zeros(G, G);
paramaters = 6*[0 1; -1 1; -1 0; -1 -1];
p = 1;
for i = 1:length(mosaic1)
    for j = 1:length(mosaic1)
        window = img(i:i+(2*d),j:j+(2*d));
        glcm = graycomatrix(window, 'NumLevels', G, 'Offset', paramaters, 'Symmetric', true);
        glcm = fix(sum(glcm, 3) / length(paramaters)); % average of glcm for different offstes
        glcms(:,:,p) = glcm;
        p = p + 1;
    end
end

%% Create feature images
[IDM13 INR13 SHD13] = featureimages(glcms, size(mosaic1));
%%
figure,
subplot(2,2,1), imshow(IDM13, []);
title('IDM isotropic mosaic1');
subplot(2,2,2), imshow(INR13, []);
title('INR isotropic mosaic1');
subplot(2,2,3), imshow(SHD13, []);
title('SHD isotropic mosaic1');
saveas(gcf,'m1[isotropic].png');

%% Now for mosaic 2
img = p_mosaic2;

%% Compute glcm for mosaic2 isotropic with step length 6
glcms = zeros(G, G);
paramaters = 6*[0 1; -1 1; -1 0; -1 -1];
p = 1;
for i = 1:length(mosaic1)
    for j = 1:length(mosaic1)
        window = img(i:i+(2*d),j:j+(2*d));
        glcm = graycomatrix(window, 'NumLevels', G, 'Offset', paramaters, 'Symmetric', true);
        glcm = fix(sum(glcm, 3) / length(paramaters)); % average of glcm for different offstes
        glcms(:,:,p) = glcm;
        p = p + 1;
    end
end

%% Create feature images
[IDM21 INR21 SHD21] = featureimages(glcms, size(mosaic1));
%%
figure,
subplot(2,2,1), imshow(IDM21, []);
title('IDM isotropic mosaic2');
subplot(2,2,2), imshow(INR21, []);
title('INR isotropic mosaic2');
subplot(2,2,3), imshow(SHD21, []);
title('SHD isotropic mosaic2');
saveas(gcf,'m2[isotropic].png');

%% Compute glcm for mosaic2 [0 3]
glcms = zeros(G, G);
paramaters = [0 3];
p = 1;
for i = 1:length(mosaic1)
    for j = 1:length(mosaic1)
        window = img(i:i+(2*d),j:j+(2*d));
        glcms(:,:,p) = graycomatrix(window, 'NumLevels', G, 'Offset', paramaters, 'Symmetric', true);
        p = p + 1;
    end
end

%% Create feature images
[IDM22 INR22 SHD22] = featureimages(glcms, size(mosaic1));
%%
figure,
subplot(2,2,1), imshow(IDM22, []);
title('IDM [0 3] mosaic2');
subplot(2,2,2), imshow(INR22, []);
title('INR [0 3] mosaic2');
subplot(2,2,3), imshow(SHD22, []);
title('SHD [0 3] mosaic2');
saveas(gcf,'m2[03].png');

%% Compute glcm for mosaic2 [0 4; 4 0]
glcms = zeros(G, G);
paramaters = [0 4; 4 0];
p = 1;
for i = 1:length(mosaic1)
    for j = 1:length(mosaic1)
        window = img(i:i+(2*d),j:j+(2*d));
        glcm = graycomatrix(window, 'NumLevels', G, 'Offset', paramaters, 'Symmetric', true);
        glcm = fix(sum(glcm, 3) / length(paramaters)); % average of glcm for different offstes
        glcms(:,:,p) = glcm;
        p = p + 1;
    end
end

%% Create feature images
[IDM23 INR23 SHD23] = featureimages(glcms, size(mosaic1));
%%
figure,
subplot(2,2,1), imshow(IDM23, []);
title('IDM [0 4; 4 0] mosaic2');
subplot(2,2,2), imshow(INR23, []);
title('INR [0 4; 4 0] mosaic2');
subplot(2,2,3), imshow(SHD23, []);
title('SHD [0 4; 4 0] mosaic2');
saveas(gcf,'m2[04;40].png');

%% Compute glcm for mosaic2 [3 3; -3 3]
glcms = zeros(G, G);
paramaters = [3 3; -3 3];
p = 1;
for i = 1:length(mosaic1)
    for j = 1:length(mosaic1)
        window = img(i:i+(2*d),j:j+(2*d));
        glcm = graycomatrix(window, 'NumLevels', G, 'Offset', paramaters, 'Symmetric', true);
        glcm = fix(sum(glcm, 3) / length(paramaters)); % average of glcm for different offstes
        glcms(:,:,p) = glcm;
        p = p + 1;
    end
end

%% Create feature images
[IDM24 INR24 SHD24] = featureimages(glcms, size(mosaic1));
%%
figure,
subplot(2,2,1), imshow(IDM24, []);
title('IDM [3 3; -3 3] mosaic2');
subplot(2,2,2), imshow(INR24, []);
title('INR [3 3; -3 3] mosaic2');
subplot(2,2,3), imshow(SHD24, []);
title('SHD [3 3; -3 3] mosaic2');
saveas(gcf,'m2[33;-33].png');
