% Ib=background image
% I=input image
% im=background removed image
%%
Ib = imread('Images/Background.JPG');
I = imread('Images/Image.jpg');
%%
I1=rgb2gray(I);
Ib1=rgb2gray(Ib);
% imshow(Ib1);
%%
Id=imsubtract(Ib1,I1);
Id_new=Id;
imshow(Id);
%%
Id_new=bwareaopen(Id_new,500,8);
Id_new=imfill(Id_new,'holes');
BW=Id_new;
Id_new=uint8(Id_new);
[r, c]=size(Id_new);
for i=1:r
    for j=1:c
        if Id_new(i,j)==255
            Id_new(i,j)=1;
        end
    end
end
im(:,:,1)=I(:,:,1).*Id_new;
im(:,:,2)=I(:,:,2).*Id_new;
im(:,:,3)=I(:,:,3).*Id_new;
imshow(im);
