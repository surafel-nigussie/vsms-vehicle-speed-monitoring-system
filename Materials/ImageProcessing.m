%%Load image of the license plate...
I = imread('Images/car-plate (5).jpg'); 
imshow(I);
%%Perform Debluring
%%Noise Reduction

    %%For Detecting Text from the license plate only
     %%ocrResults     = ocr(I);
     %%recognizedText = ocrResults.Text;
     %%disp(recognizedText);
    %%***
    
%***
Igray = rgb2gray(I); 
imshow(Igray); 
%**


se = strel('disk',12);
tophatFiltered = imtophat(Igray,se);
contrastAdjusted = imadjust(tophatFiltered);
imshow(contrastAdjusted);

%%***%%
Ibw = im2bw(Igray,graythresh(Igray)); 
imshow(Ibw);
%%***%%
Iedge = edge(Ibw); 
imshow(Iedge);
%%***%%
se = strel('square',2); 
Iedge2 = imdilate(Iedge, se); 
imshow(Iedge2);
%%***%%
Ifill= imfill(Iedge2,'holes'); 
imshow(Ifill);
%%***%%
[Ilabel, num] = bwlabel(Ifill);
Iprops = regionprops(Ilabel); 
Ibox = [Iprops.BoundingBox]; 
Ibox = reshape(Ibox,[4 num]);
hold on; 
%%***%%
for cnt = 1:num 
    rectangle('position',Ibox(:,cnt),'edgecolor','r'); 
end
figure, imshow(Ibox);
k = ocr(Ibox);
%%***%%
for j = 1:num
    [row, col] = find(Ilabel == j);
    len = max(row) - min(row) + 2;
    brdth = max(col) - min(col) + 2;
    target = uint8(zeros(len, brdth));
    sy = min(col) - 1;
    sx = min(row) - 1;
    for i = 1:size(row, 1)  
        x = row(i,1) - sx;
        y = col(i,1) - sy;
        target(x,y) = I(row(i,1), col(i,1));
    end
    %%figure, imshow(target);
    imshow(target);
    ocrtxt = ocr(I);%%original image
end
ocrtxt.Text%%to display text processed from the image


