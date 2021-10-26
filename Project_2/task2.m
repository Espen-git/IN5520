%% Load data
clear all;
files = dir('oblig2-matlab\*.mat');
folder_name = 'oblig2-matlab\';
for i=1:length(files)
    load(append('oblig2-matlab\', string(files(i).name)));
end

%%
