%%
load_data
load('glcms1.mat');
load('glcms2.mat');
load('quadrants_mosaic1.mat');
load('quadrants_mosaic2.mat');
load('quadrants_mosaic3.mat');

%% Feature matrices (for training)
[class_1_row, class_1_col] = find(training_mask==1);
[class_2_row, class_2_col] = find(training_mask==2);
[class_3_row, class_3_col] = find(training_mask==3);
[class_4_row, class_4_col] = find(training_mask==4);
cls1 = zeros(length(class_1_row),4); %class 1 (values/observations, feature)
cls2 = zeros(length(class_2_row),4); %class 2       
cls3 = zeros(length(class_3_row),4); %class 3
cls4 = zeros(length(class_4_row),4); %class 4
quadrant_images(1,:) = quadrants_mosaic1(1,:,1); % d1 Q1 feature image
quadrant_images(2,:) = quadrants_mosaic1(1,:,2); % d1 Q2 feature image
quadrant_images(3,:) = quadrants_mosaic1(1,:,5); % d1 Q5 feature image
quadrant_images(4,:) = quadrants_mosaic1(1,:,6); % d1 Q6 feature image
for i = 1:4
    quadrant_image = quadrant_images(i,:);
    quadrant_image = reshape(quadrant_image, [512, 512]).'; % transpose because reshape creates column by column instead of row by row

    %Class1
    q = 1;
    for j = [class_1_row'; class_1_col']
        cls1(q,i) = quadrant_image(j(1), j(2));
        q = q + 1;
    end
    
    %Class2
    q = 1;
    for j = [class_2_row'; class_2_col']
        cls2(q,i) = quadrant_image(j(1), j(2));
        q = q + 1;
    end
    
    %Class3
    q = 1;
    for j = [class_3_row'; class_3_col']
        cls3(q,i) = quadrant_image(j(1), j(2));
        q = q + 1;
    end
    
    %Class4
    q = 1;
    for j = [class_4_row'; class_4_col']
        cls4(q,i) = quadrant_image(j(1), j(2));
        q = q + 1;
    end
end

%% Covariance matrix and means (training)
cov_class1 = cov(cls1);
cov_class2 = cov(cls2);
cov_class3 = cov(cls3);
cov_class4 = cov(cls4);

means_class1 = mean(cls1);
means_class2 = mean(cls2);
means_class3 = mean(cls3);
means_class4 = mean(cls4);

%% Feature matrices
x1 = [quadrants_mosaic1(1,:,1); quadrants_mosaic1(1,:,2); quadrants_mosaic1(1,:,5); quadrants_mosaic1(1,:,6)];
x2 = [quadrants_mosaic2(1,:,1); quadrants_mosaic2(1,:,2); quadrants_mosaic2(1,:,5); quadrants_mosaic2(1,:,6)];
x3 = [quadrants_mosaic3(1,:,1); quadrants_mosaic3(1,:,2); quadrants_mosaic3(1,:,5); quadrants_mosaic3(1,:,6)];
%% Predicting / Classifying
numVar = 4;

% Mosaic 1
res1 = zeros(512*512,1);
for i = 1:(512*512)
    pixel = x1(:,i);
    p1 = predict(pixel, cov_class1, means_class1, numVar);
    p2 = predict(pixel, cov_class2, means_class2, numVar);
    p3 = predict(pixel, cov_class3, means_class3, numVar);
    p4 = predict(pixel, cov_class4, means_class4, numVar);
    P = [p1, p2, p3, p4];
    [M, I] = max(P);
    res1(i) = I;
end

% Mosaic 2
res2 = zeros(512*512,1);
for i = 1:(512*512)
    pixel = x2(:,i);
    p1 = predict(pixel, cov_class1, means_class1, numVar);
    p2 = predict(pixel, cov_class2, means_class2, numVar);
    p3 = predict(pixel, cov_class3, means_class3, numVar);
    p4 = predict(pixel, cov_class4, means_class4, numVar);
    P = [p1, p2, p3, p4];
    [M, I] = max(P);
    res2(i) = I;
end

% Mosaic 3
res3 = zeros(512*512,1);
for i = 1:(512*512)
    pixel = x3(:,i);
    p1 = predict(pixel, cov_class1, means_class1, numVar);
    p2 = predict(pixel, cov_class2, means_class2, numVar);
    p3 = predict(pixel, cov_class3, means_class3, numVar);
    p4 = predict(pixel, cov_class4, means_class4, numVar);
    P = [p1, p2, p3, p4];
    [M, I] = max(P);
    res3(i) = I;
end
%% Showing classification results
res1_plot = uint8(reshape(res1, [512, 512]).');
figure;
imshow(res1_plot,	;
title('Mosaic1');

res2_plot = uint8(reshape(res2, [512, 512]).');
figure;
imshow(res2_plot,[]);
title('Mosaic2');

res3_plot = uint8(reshape(res3, [512, 512]).');
figure;
imshow(res3_plot,[]);
title('Mosaic3');

%% Accuracy and Confusion matrix

masks(:,:,1) = training_mask;
masks(:,:,2) = mask_mosaic2_test;
masks(:,:,3) = mask_mosaic3_test;

results(:,:,1) = res1_plot;
results(:,:,2) = res2_plot;
results(:,:,3) = res3_plot;

acc_list = zeros(4,3);
conf_list = zeros(4,4,3);
for i = 1:3 % for each picture/mask
    mask = masks(:,:,i);
    % Get indexes for the possition of pixels in a given class
    [class_1_row, class_1_col] = find(mask==1);
    [class_2_row, class_2_col] = find(mask==2);
    [class_3_row, class_3_col] = find(mask==3);
    [class_4_row, class_4_col] = find(mask==4);
    
    %[accuracy, confusion] = acc_conf(class_1_row, class_2_row, res1_plot)
    accuracy = [0, 0, 0, 0];
    confusion = zeros(4);
    
    % Class 1
    for j = [class_1_row'; class_1_col']
        res = results(j(1),j(2),i);
        if res == 1
            accuracy(1) = accuracy(1) + 1;
        end
        confusion(1,res) = confusion(1,res) + 1;
    end
    accuracy(1) = accuracy(1)/length(class_1_row);
    
    % Class 2
    for j = [class_2_row'; class_2_col']
        res = results(j(1),j(2),i);
        if res == 2
            accuracy(2) = accuracy(2) + 1;
        end
        confusion(2,res) = confusion(2,res) + 1;
    end
    accuracy(2) = accuracy(2)/length(class_2_row);
    
    % Class 3
    for j = [class_3_row'; class_3_col']
        res = results(j(1),j(2),i);
        if res == 3
            accuracy(3) = accuracy(3) + 1;
        end
        confusion(3,res) = confusion(3,res) + 1;
    end
    accuracy(3) = accuracy(3)/length(class_3_row);
    
    % Class 4
    for j = [class_4_row'; class_4_col']
        res = results(j(1),j(2),i);
        if res == 4
            accuracy(4) = accuracy(4) + 1;
        end
        confusion(4,res) = confusion(4,res) + 1;
    end
    accuracy(4) = accuracy(4)/length(class_4_row);

    acc_list(:,i) = accuracy;
    conf_list(:,:,i) = confusion;
end

%% Plot
figure;
confusionchart(conf_list(:,:,1));
title('Cunfusion matric Mosaic1 train');

figure;
subplot(1,2,1);
confusionchart(conf_list(:,:,2));
title('Mosaic2 test');
subplot(1,2,2);
confusionchart(conf_list(:,:,3));
title('Mosaic3 test');
sgtitle('Confusion matrices')

for i = 1:3
    acc_list(:,i)
end