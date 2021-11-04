%%
load_data
load('glcms1.mat');
load('glcms2.mat');

%%
% quadrants_mosaic1

[class_1_row, class_1_col] = find(training_mask==1);
tmp = zeros(size(mosaic1_train));
for i = [class_1_row'; class_1_col']
    tmp(i(1), i(2)) = mosaic1_train(i(1), i(2));
end

%%

imshow(tmp, [])