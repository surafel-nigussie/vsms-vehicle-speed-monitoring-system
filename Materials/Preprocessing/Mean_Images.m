close all;
set(0, 'DefaultFigureWindowStyle', 'Docked');
base_dir = 'C:\Users\Surafel Nigussie\Documents\MATLAB';
cd(base_dir);
f_list = dir('*jpg');N = 20;
img = zeros(288, 352, N);
for i = 1:N
    img_tmp = imread(F_list(i).name);
    img(:,:,1) = img_tmp(:,:,1);
end
bck_img = (mean(img, 3));
subplot(121);
imagesc(bck_img)
subplot(122);
imagesc(img(:,:,1))
colormap(grey)
clear img;

