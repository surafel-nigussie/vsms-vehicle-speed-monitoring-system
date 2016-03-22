%%
bkg = imread('Images/Background.jpg');
img = imread('Images/Image.jpg');

%%
% img_gray = rgb2gray(img);
% bkg_gray = rgb2gray(bkg);

img_gray = img;
bkg_gray = bkg;

%%
img_diff = imsubtract(bkg_gray,img_gray);
imshow(img_diff);

%%
hsize = 1;
sigma = 10;
gausian_filter = fspecial('gaussian', hsize, sigma);
img_gaussian = filter2(gausian_filter, img_diff, 'same');
imshow(img_gaussian);

%%
[img_lable, lable_index] = bwlabel(img_diff);
img_prop = regionprops(img_lable); 
img_box = [img_prop.BoundingBox]; 
img_box = reshape(img_box,[4 lable_index]);
for countr = 1:lable_index 
    rectangle('position',img_box(:,countr),'edgecolor','g'); 
end

%%
for j = 1:lable_index
    [row, col] = find(img_lable == j);
    len = max(row) - min(row) + 2;
    brdth = max(col) - min(col) + 2;
    target = uint8(zeros(len, brdth));
    sy = min(col) - 1;
    sx = min(row) - 1;
    for i = 1:size(row, 1)  
        x = row(i,1) - sx;
        y = col(i,1) - sy;
        target(x,y) = img(row(i,1), col(i,1));
    end
    imshow(target);
end

%%
clear all;
clc;
