%%
bkg = imread('Images/Background.JPG');
img = imread('Images/Image.jpg');

%%
img_gray = rgb2gray(img);
bkg_gray = rgb2gray(bkg);

%%
img_diff = imsubtract(bkg_gray,img_gray);
imshow(img_diff);

%%
img_ = img_diff;
% img_ = bwareaopen(img_diff,100);
img_filled = imfill(img_,'holes');
imshow(img_filled);

%%
img_filled=uint8(img_filled);
[r, c]=size(img_filled);
for i=1:r
    for j=1:c
        if img_filled(i,j)==255
            img_filled(i,j)=1;
        end
    end
end
output_image(:,:,1)=img(:,:,1).*img_filled;
output_image(:,:,2)=img(:,:,2).*img_filled;
output_image(:,:,3)=img(:,:,3).*img_filled;
imshow(output_image);

%%
clear all;
clc;