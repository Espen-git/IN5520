%% Load data
load_data
% konvert to unit8
%mosaic1_train = uint8(255 * mat2gray(mosaic1_train)); 
%mosaic2_test = uint8(255 * mat2gray(mosaic2_test));
%mosaic3_test = uint8(255 * mat2gray(mosaic3_test));

%% Pad images
window_size = 31;
d = (window_size-1)/2;

p_mosaic1 = padarray(mosaic1_train,[d d],'symmetric','both');
p_mosaic2 = padarray(mosaic2_test,[d d],'symmetric','both');
p_mosaic3 = padarray(mosaic3_test,[d d],'symmetric','both');
%figure, imshow(p_mosaic1,[]);
%figure, imshow(p_mosaic2,[]);
%figure, imshow(p_mosaic3,[]);

%% Compute glcms for d1 and d2
G = 16;
% Reusing code from project 1
glcms1 = zeros(3, G, G);
glcms2 = zeros(3, G, G);
paramaters1 = [0 1]; % dx=1 dy=0
paramaters2 = [-1 0]; % dx=0 dy=-1
images = [p_mosaic1]; images(:,:,2) = p_mosaic2; images(:,:,3) = p_mosaic3;
for image_index = 1:3
    img = images(:,:,image_index);
    p = 1;
    for i = 1:(length(img)-(2*d))
        for j = 1:(length(img)-(2*d))
            window = img(i:i+(2*d),j:j+(2*d));
            glcms1(image_index,:,:,p) = graycomatrix(window, 'NumLevels', G, 'Offset', paramaters1, 'Symmetric', true);
            glcms2(image_index,:,:,p) = graycomatrix(window, 'NumLevels', G, 'Offset', paramaters2, 'Symmetric', true);
            p = p + 1;
        end
    end
end

%% Load glcms
load('glcms1.mat');
load('glcms2.mat');

%% Quadrants
shape = size(glcms1);
num_glcms = shape(4);% number of glcms for each picture/direction combination
quadrants_mosaic1 = zeros(2, num_glcms, 4); % dimetions represent (direction/offset, glcm, quadrant)
quadrants_mosaic2 = zeros(2, num_glcms, 4);
quadrants_mosaic3 = zeros(2, num_glcms, 4);

G = 16;
for p = 1:num_glcms
    % Compute quadrants
    % d1
    [m1d1Q1, m1d1Q2, m1d1Q3, m1d1Q4, m1d1Q5, m1d1Q6, m1d1Q7, m1d1Q8] = computequadrants(reshape(glcms1(1,:,:,p), [G, G])); % reshape to go from 1x16x16 to 16x16
    m1d1 = [m1d1Q1, m1d1Q2, m1d1Q3, m1d1Q4, m1d1Q5, m1d1Q6, m1d1Q7, m1d1Q8];
    [m2d1Q1, m2d1Q2, m2d1Q3, m2d1Q4, m2d1Q5, m2d1Q6, m2d1Q7, m2d1Q8] = computequadrants(reshape(glcms1(2,:,:,p), [G, G]));
    m2d1 = [m2d1Q1, m2d1Q2, m2d1Q3, m2d1Q4, m2d1Q5, m2d1Q6, m2d1Q7, m2d1Q8];
    [m3d1Q1, m3d1Q2, m3d1Q3, m3d1Q4, m3d1Q5, m3d1Q6, m3d1Q7, m3d1Q8] = computequadrants(reshape(glcms1(3,:,:,p), [G, G]));
    m3d1 = [m3d1Q1, m3d1Q2, m3d1Q3, m3d1Q4, m3d1Q5, m3d1Q6, m3d1Q7, m3d1Q8];
    % d2
    [m1d2Q1, m1d2Q2, m1d2Q3, m1d2Q4, m1d2Q5, m1d2Q6, m1d2Q7, m1d2Q8] = computequadrants(reshape(glcms2(1,:,:,p), [G, G]));
    m1d2 = [m1d2Q1, m1d2Q2, m1d2Q3, m1d2Q4, m1d2Q5, m1d2Q6, m1d2Q7, m1d2Q8];
    [m2d2Q1, m2d2Q2, m2d2Q3, m2d2Q4, m2d2Q5, m2d2Q6, m2d2Q7, m2d2Q8] = computequadrants(reshape(glcms2(2,:,:,p), [G, G]));
    m2d2 = [m2d2Q1, m2d2Q2, m2d2Q3, m2d2Q4, m2d2Q5, m2d2Q6, m2d2Q7, m2d2Q8];
    [m3d2Q1, m3d2Q2, m3d2Q3, m3d2Q4, m3d2Q5, m3d2Q6, m3d2Q7, m3d2Q8] = computequadrants(reshape(glcms2(3,:,:,p), [G, G]));
    m3d2 = [m3d2Q1, m3d2Q2, m3d2Q3, m3d2Q4, m3d2Q5, m3d2Q6, m3d2Q7, m3d2Q8];
    
    
    % Write quadrant vaules to matrix 
    for i = 1:8
        quadrants_mosaic1(1,p,i) = m1d1(i);
        quadrants_mosaic1(2,p,i) = m1d2(i);
        
        quadrants_mosaic2(1,p,i) = m2d1(i);
        quadrants_mosaic2(2,p,i) = m2d2(i);
        
        quadrants_mosaic3(1,p,i) = m3d1(i);
        quadrants_mosaic3(2,p,i) = m3d2(i);
    end
    %quadrants_mosaic1(1, p, 1) = m1d1Q1; quadrants_mosaic1(1, p, 2) = m1d1Q2; quadrants_mosaic1(1, p, 3) = m1d1Q3; quadrants_mosaic1(1, p, 4) = m1d1Q4;
    %quadrants_mosaic1(2, p, 1) = m1d2Q1; quadrants_mosaic1(2, p, 2) = m1d2Q2; quadrants_mosaic1(2, p, 3) = m1d2Q3; quadrants_mosaic1(2, p, 4) = m1d2Q4;
   
    %quadrants_mosaic2(1, p, 1) = m2d1Q1; quadrants_mosaic2(1, p, 2) = m2d1Q2; quadrants_mosaic2(1, p, 3) = m2d1Q3; quadrants_mosaic2(1, p, 4) = m2d1Q4;
    %quadrants_mosaic2(2, p, 1) = m2d2Q1; quadrants_mosaic2(2, p, 2) = m2d2Q2; quadrants_mosaic2(2, p, 3) = m2d2Q3; quadrants_mosaic2(2, p, 4) = m2d2Q4;
    
    %quadrants_mosaic3(1, p, 1) = m3d1Q1; quadrants_mosaic3(1, p, 2) = m3d1Q2; quadrants_mosaic3(1, p, 3) = m3d1Q3; quadrants_mosaic3(1, p, 4) = m3d1Q4;
    %quadrants_mosaic3(2, p, 1) = m3d2Q1; quadrants_mosaic3(2, p, 2) = m3d2Q2; quadrants_mosaic3(2, p, 3) = m3d2Q3; quadrants_mosaic3(2, p, 4) = m3d2Q4;
end

%% Feature images
images = quadrants_mosaic1(1,:,1); % d1 Q1
images(:,:,2) = quadrants_mosaic1(1,:,2); % d1 Q2 
images(:,:,3) = quadrants_mosaic1(1,:,4); % d1 Q4
images(:,:,4) = quadrants_mosaic1(1,:,5); % d1 Q5
images(:,:,5) = quadrants_mosaic1(1,:,6); % d1 Q6

images(:,:,6) = quadrants_mosaic1(2,:,1); % d2 Q1
images(:,:,8) = quadrants_mosaic1(2,:,4); % d2 Q4
images(:,:,9) = quadrants_mosaic1(2,:,5); % d2 Q5
images(:,:,10) = quadrants_mosaic1(2,:,6); % d2 Q6

titles = {'d1 Q1','d1 Q2','d1 Q4','d1 Q5','d1 Q6','d2 Q1',' ','d2 Q4','d2 Q5','d2 Q6'};
figure;
for i = 1:10
    image = images(:,:,i);
    image = uint8(255 * mat2gray(image));
    image = reshape(image, [512, 512]).'; % transpose because reshape creates column by column instead of row by row
    if i ~= 7
        subplot(2,5,i);
        imshow(image); 
        title(titles(i));
    end
end
