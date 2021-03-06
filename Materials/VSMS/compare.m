function [indicador]=compare(input_image,background,threshold)
indicador = 0;

%%
% Perform image difference from the new image and the background image
difference = (abs(input_image(:,:,1) - background(:,:,1)) > threshold) | (abs(input_image(:,:,2) - background(:,:,2)) > threshold) ...
                    | (abs(input_image(:,:,3) - background(:,:,3)) > threshold);    
                
%%
% Performs morphological closing (dilation followed by erosion).
b = bwmorph(difference,'close');

%%
% Performs morphological opening (erosion followed by dilation).
difference = bwmorph(b,'open');        
difference = bwmorph(difference,'erode',2);

%%
% Select the biggest object
big_object = bwlabel(difference,8);

%%
% Measure properties of image regions such as: 'Area', 'Centroid', and 'Box'
object = regionprops(big_object);

%%
% Number of objects in in the image.
N = size(object,1); 

%%
% Return whether no object in the image
if N < 1||isempty(object) 
    return
end

%%
% Remove holes less than 200 pixels
holeFilled = find([object.Area]<200);
if ~isempty(holeFilled)
    object(holeFilled)=[ ];
end

%%
% Count objects
N = size(object,1);
if N < 1 || isempty(object)
    return
end

%%
Ibwopen = bwareaopen(big_object, 200);
Ifill = imfill(Ibwopen,'holes');
% figure, imshow(Ifill);

%%
se = strel('square',20); 
IDialate = imdilate(Ifill, se); 
% figure, imshow(IDialate);

%%
[img_labled, Index] = bwlabel(IDialate);

%%
CC = bwconncomp(IDialate);
numPixels = cellfun(@numel,CC.PixelIdxList);
for count = 1:Index
    lbl_pixel = numPixels(1, count);
    if ( lbl_pixel < 200 )
        IDialate(CC.PixelIdxList{count}) = 0;
    end
end
% figure, imshow(IDialate);

%%
for j = 1:Index
    [row, col] = find(img_labled == j);
    len = max(row) - min(row) + 2;
    brdth = max(col) - min(col) + 2;
    target = int16(zeros(len, brdth));
    sy = min(col) - 1;
    sx = min(row) - 1;
    for i = 1:size(row, 1)  
        x = row(i,1) - sx;
        y = col(i,1) - sy;
        target(x,y) = input_image(row(i,1), col(i,1));
    end
end
% figure, imshow(target);

%%
% Draw a rectangle and center point for every object in the image
for n = 1 : N
    hold on
    centroid = object(n).Centroid;
    C_X = centroid(1);
    C_Y = centroid(2);
    rectangle('Position',object(n).BoundingBox,'EdgeColor','g','LineWidth',1);
    plot(C_X,C_Y,'Color','g','Marker','+','LineWidth',1);
    hold off
end

indicador = 1;
end