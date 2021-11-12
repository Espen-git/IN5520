clear all;

folder_name = 'oblig2-matlab\';
mosaic1_train = load(append(folder_name, 'mosaic1_train')).mosaic1_train;
mosaic1_train = histeq(uint8(255 * mat2gray(mosaic1_train))); % Convert and equalize histogram
mosaic2_test = load(append(folder_name, 'mosaic2_test')).mosaic2_test;
mosaic2_test = histeq(uint8(255 * mat2gray(mosaic2_test))); % Convert and equalize histogram
mosaic3_test = load(append(folder_name, 'mosaic3_test')).mosaic3_test;
mosaic3_test = histeq(uint8(255 * mat2gray(mosaic3_test))); % Convert and equalize histogram
mask_mosaic2_test = load(append(folder_name, 'mask_mosaic2_test')).mosaic2_test;
mask_mosaic3_test = load(append(folder_name, 'mask_mosaic3_test')).mosaic3_test;
training_mask = load(append(folder_name, 'training_mask')).training_mask;
texture1dx0dymin1 = load(append(folder_name, 'texture1dx0dymin1')).texture1dx0dymin1;
texture1dx1dy0 = load(append(folder_name, 'texture1dx1dy0')).g1d01;
texture1dx1dymin1 = load(append(folder_name, 'texture1dx1dymin1')).texture1dx1dymin1;
texture1dxmin1dymin1 = load(append(folder_name, 'texture1dxmin1dymin1')).texture1dxmin1dymin1;
texture2dx0dymin1 = load(append(folder_name, 'texture2dx0dymin1')).texture2dx0dymin1;
texture2dxmin1dymin1 = load(append(folder_name, 'texture2dxmin1dymin1')).texture2dxmin1dymin1;
texture2dx1dy0 = load(append(folder_name, 'texture2dxplus1dy0')).texture2dx1dy0;
texture2dx1dymin1 = load(append(folder_name, 'texture2dxplus1dymin1')).texture2dx1dymin1;
texture3dx0dymin1 = load(append(folder_name, 'texture3dx0dymin1')).texture3dx0dymin1;
texture3dxmin1dymin1 = load(append(folder_name, 'texture3dxmin1dymin1')).texture3dxmin1dymin1;
texture3dx1dy0 = load(append(folder_name, 'texture3dxplus1dy0')).texture3dx1dy0;
texture3dx1dymin1 = load(append(folder_name, 'texture3dxplus1dymin1')).texture3dx1dymin1;
texture4dx0dymin1 = load(append(folder_name, 'texture4dx0dymin1')).texture4dx0dymin1;
texture4dxmin1dymin1 = load(append(folder_name, 'texture4dxmin1dymin1')).texture4dxmin1dymin1;
texture4dx1dy0 = load(append(folder_name, 'texture4dxplus1dy0')).texture4dx1dy0;
texture4dx1dymin1 = load(append(folder_name, 'texture4dxplus1dymin1')).texture4dx1dymin1;
