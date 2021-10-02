%%
window_size = 31;
d = (window_size-1)/2;

mosaic1_eq = histeq(mosaic1);
figure, imshow(mosaic1_eq);
N = 16; % Number of gray levels
flag = hot;
paramaters = [0 1];

%%
G = 16;
img = uint8(round(double(mosaic1_eq) * (G-1) / double(max(mosaic1_eq(:)))));
glcms = zeros(G, G);
size(glcms);
%%
p = 1;
for i = 1+d:length(mosaic1)-d
    for j = 1+d:length(mosaic1)-d
        window = img(j-d:j+d,i-d:i+d);
        glcms(:,:,p) = graycomatrix(window, 'NumLevels', G, 'Offset', paramaters, 'Symmetric', true);
        p = p + 1;
    end
end

%%
size(glcms)