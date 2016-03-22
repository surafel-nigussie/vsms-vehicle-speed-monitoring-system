%%
%Set preferences with setdbprefs.
setdbprefs('DataReturnFormat', 'cellarray');%Setting return type from database to an array
setdbprefs('NullNumberRead', 'Null_Number');%If error where accessing number 
setdbprefs('NullStringRead', 'Null_String');%If error when accessing string

%%
%Load image from database
query_result = VSMS_GetImage();
img_file_name = query_result(1).data;
image = VSMS_LoadFile(img_file_name);

%%
%Convert RGB image into black and white
img_gray = VSMS_RGB2Gray( image );

%% 
%Adjusting image color contrast
% img_adjusted = VSMS_Adjust( img_gray );

%%
%Replacing pixel values less than 150 to black
threshold_value = 150;
img_thresholded = VSMS_Thresholding( img_gray, threshold_value );

%%
%Filling holes that are present as noise
img_filled = VSMS_FillHoles( img_thresholded );

%%
%Dilating the image with square 
% dialte_value = 20;
img_dialated = VSMS_Dialate( img_filled );

%%
%Label elements that are connected
Index = VSMS_Lable( img_dialated );

%%
%For detecting connected regions pixel size greater than 12000 and
%replacing them to black
img_connected = VSMS_ConnectedRegions( img_dialated, Index );

%%
%To place greeen border for the license plate
[Img_label2, Indexed] = bwlabel(img_connected);
Img_prop = regionprops(Img_label2); 
Img_Boxs = [Img_prop.BoundingBox]; 
Img_Boxs = reshape(Img_Boxs,[4 Indexed]);
for countr = 1:Indexed 
    rectangle('position',Img_Boxs(:,countr),'edgecolor','g'); 
end
% img_PlateBorder = VSMS_PlateBorder( img_connected );

%%
%
for j = 1:Indexed
    [row, col] = find(Img_label2 == j);
    len = max(row) - min(row) + 2;
    brdth = max(col) - min(col) + 2;
    target = uint8(zeros(len, brdth));
    sy = min(col) - 1;
    sx = min(row) - 1;
    for i = 1:size(row, 1)  
        x = row(i,1) - sx;
        y = col(i,1) - sy;
        target(x,y) = image(row(i,1), col(i,1));
    end
    subplot(3,3,8); imshow(target);
end

%%
%Adjusting image color contrast
    target = imadjust(target);
    subplot(3,3,9); imshow(target);

%%
%To clear all variables and command window
clear all;
clc;
