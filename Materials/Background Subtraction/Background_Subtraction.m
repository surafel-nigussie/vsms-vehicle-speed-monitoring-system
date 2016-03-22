%%
%Clear all workspace and command line
clear all; %#ok<CLSCR>
clc;
set(0, 'DefaultFigureWindowStyle', 'Docked');

%%
%Get list of background image.
base_dir = 'C:\Users\Surafel Nigussie\Documents\MATLAB\Background Subtraction\';
cd(base_dir);
bg_frame = dir('*jpg');
 
%%
%Mean the background images.
N = 5;
img = zeros(720, 1280, N);
for i = 1:N
    img_tmp = imread(bg_frame(i).name);
    img(:,:,i) = img_tmp(:,:,1);
end
bckgrnd_mean = (mean(img,3));

%%
%Plot the resulting image.
subplot(121); imagesc(bckgrnd_mean);
subplot(122); imagesc(img(:,:,1));
colormap(gray)

%%
%
img_img = double(imread('WIN_20160103_172041.JPG'));
img_1 = img_img(:,:,1);
sub_img = (img_1 - bckgrnd_mean);
imshow(sub_img);
 