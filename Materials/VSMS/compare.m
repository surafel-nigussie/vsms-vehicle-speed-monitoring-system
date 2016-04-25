function [indicador]=compare(input_image,background,threshold)
indicador = 0;

%%
% Perform image difference from the new image and the background image
difference = (abs(input_image(:,:,1)-background(:,:,1)) > threshold) | (abs(input_image(:,:,2) - background(:,:,2)) > threshold) ...
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
% Number of objects in in the image.
N = size(object,1); 
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
N=size(object,1);
if N < 1 || isempty(object)
    return
end

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