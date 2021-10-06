%% Import pictures
mosaic1 = imread('mosaic1.png');
mosaic2 = imread('mosaic2.png');

%% Pad image
window_size = 31;
d = (window_size-1)/2;

mosaic1_eq = histeq(mosaic1);
%figure, imshow(mosaic1_eq);
p_mosaic1 = padarray(mosaic1_eq,[d d],'symmetric','both');
%figure, imshow(p_mosaic1);

%%
flag = hot;
paramaters = [0 1];
G = 16;
img = p_mosaic1;
%img = uint8(round(double(p_mosaic1) * (G-1) / double(max(p_mosaic1(:)))));
glcms = zeros(G, G);

%% Compute glcm of all windows
p = 1;
for i = 1:length(mosaic1)
    for j = 1:length(mosaic1)
        window = img(i:i+(2*d),j:j+(2*d));
        glcms(:,:,p) = graycomatrix(window, 'NumLevels', G, 'Offset', paramaters, 'Symmetric', true);
        p = p + 1;
    end
end

%% Normalize glcms
glcms_normalized = zeros(G, G);
for i = 1:length(glcms)
   glcms_normalized(:,:,i) = glcms(:,:,i)./(sum(glcms(:,:,i), 'all'));
end

%% Compute features
feature_img = zeros(size(mosaic1));
for i = 1:length(glcms)
    feature_img(i) = inertia(glcms_normalized(:,:,i));
end

figure, imshow(feature_img, []);
%seg_I = imquantize(I,thresh);