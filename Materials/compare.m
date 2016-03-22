function [indicador]=compare(input_image,background,threshold)
indicador = 0;
% 
difference = (abs(input_image(:,:,1)-background(:,:,1)) > threshold) | (abs(input_image(:,:,2) - background(:,:,2)) > threshold) ...
                    | (abs(input_image(:,:,3) - background(:,:,3)) > threshold);             
% Remove noise (eliminating little holes and refill openings)
% a = bwlabel(diference,8);
% Performs morphological closing (dilation followed by erosion).

b = bwmorph(difference,'close');
% Performs morphological opening (erosion followed by dilation).
difference = bwmorph(b,'open');        
difference = bwmorph(difference,'erode',2);
% Seelct the biggest object
big_object = bwlabel(difference,8);
% Measure properties of image regions such as: 'Area', 'Centroid', and 'Box'
object = regionprops(big_object);
N = size(object,1); % Number of objects in in the image.

if N < 1||isempty(object) % Return whether no object in the image
    return
end
% Remove holes less than 200 pixels
s=find([object.Area]<200);
if ~isempty(s)
    object(s)=[ ];
end
N=size(object,1);% Count objects
if N < 1 || isempty(object)
    return
end
% Draw a rectangle and center point for every object in the image
for n=1:N
    hold on
    centroid = object(n).Centroid;
    C_X = centroid(1);
    C_Y = centroid(2);
    rectangle('Position',object(n).BoundingBox,'EdgeColor','r','LineWidth',3)    
    plot(C_X,C_Y,'Color','r','Marker','+','LineWidth',3)
   
    title(['X= ',num2str(round(C_X)),' Y= ',num2str(round(C_X))])
    hold off
end

indicador = 1;
end