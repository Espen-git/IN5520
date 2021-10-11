% need to have feature images from task_c.m
%% Mosaic 1
%% Subimage 3
figure;
tresh_INR12 = 0.3;
imshow(mosaic1.*uint8(INR12 < (max(INR12(:)) * tresh_INR12)), []);
title('Image thresholded');
saveas(gcf,'1sub3seg.png');

%% remove segmented part
new_img = mosaic1 - mosaic1.*uint8(INR12 < (max(INR12(:)) * tresh_INR12));
figure;
imshow(new_img, []);
saveas(gcf,'new_img11.png');

%% Subimage 4
figure;
tresh_IDM12 = 0.54;
imshow(new_img.*uint8(IDM12 < (max(IDM12(:)) * tresh_IDM12)), []);
title('Image thresholded');
saveas(gcf,'1sub4seg.png');

%% remove segmented part
new_img = new_img - new_img.*uint8(IDM12 < (max(IDM12(:)) * tresh_IDM12));
figure;
imshow(new_img, []);
saveas(gcf,'new_img12.png');

%% Subimage 2
figure;
tresh_SHD12 = -0.15;
imshow(new_img.*uint8(SHD12 < (max(SHD12(:)) * tresh_SHD12)), []);
title('Image thresholded');
saveas(gcf,'1sub2seg.png');

%% remove segmented part
new_img = new_img - new_img.*uint8(SHD12 < (max(SHD12(:)) * tresh_SHD12));
figure;
imshow(new_img, []);
saveas(gcf,'new_img13.png');

%% subimage 1
% Did not work well
figure;
tresh_IDM13 = 0.45;
imshow(new_img.*uint8(IDM13 < (max(IDM13(:)) * tresh_IDM13)), []);
title('Image thresholded');
saveas(gcf,'1sub1seg.png');


%% Mosaic 2
%% Subimage 7
figure;
tresh_INR22 = 0.3;
imshow(mosaic2.*uint8(INR22 < (max(INR22(:)) * tresh_INR22)), []);
title('Image thresholded');
saveas(gcf,'2sub7seg.png');

%% remove segmented part
new_img = mosaic2 - mosaic2.*uint8(INR22 < (max(INR22(:)) * tresh_INR22));
figure;
imshow(new_img, []);
saveas(gcf,'new_img21.png');

%% Subimage 5
figure;
tresh_IDM23 = 0.43;
imshow(new_img.*uint8(IDM23 < (max(IDM23(:)) * tresh_IDM23)), []);
title('Image thresholded');
saveas(gcf,'2sub5seg.png');

%% remove segmented part
new_img = new_img - new_img.*uint8(IDM23 < (max(IDM23(:)) * tresh_IDM23));
figure;
imshow(new_img, []);
saveas(gcf,'new_img22.png');

%% Subimage 6
figure;
tresh_IDM22 = 0.4;
imshow(new_img.*uint8(IDM22 < (max(IDM22(:)) * tresh_IDM22)), []);
title('Image thresholded');
saveas(gcf,'2sub6seg.png');

%% remove segmented part
new_img = new_img - new_img.*uint8(IDM22 < (max(IDM22(:)) * tresh_IDM22));
figure;
imshow(new_img, []);
saveas(gcf,'new_img23.png');

%% Subimage 8
figure;
tresh_IDM21 = 0.5;
imshow(new_img.*uint8(IDM21 < (max(IDM21(:)) * tresh_IDM21)), []);
title('Image thresholded');
saveas(gcf,'2sub8seg.png')

