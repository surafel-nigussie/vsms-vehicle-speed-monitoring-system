function FrameProcessor(obj,event,hImage)
%%
In = event.Data;
Ib = getappdata(hImage,'HandleToBackgroundImage');

%%
INgray = im2int16(rgb2gray(In));
IBgray = im2int16(rgb2gray(Ib));
% figure, imshow(IBgray);

%%
Isubt = imsubtract(IBgray,INgray);
% figure, imshow(Isubt);

%%
[r,c] = size(Isubt);
Ivalues = zeros(r,c,'uint8');
for i = 1:r
    for j = 1:c
        if Isubt(i,j) <= 10
            Ivalues(i,j) = 0;
        else
            Ivalues(i,j) = 255;
        end
    end
end
% figure, imshow(Ivalues);

%%
Ibwopen = bwareaopen(Ivalues, 200);
Ifill = imfill(Ibwopen,'holes');
% figure, imshow(Ifill);

%%
se = strel('square',20); 
IDialated = imdilate(Ifill, se); 
% figure, imshow(IDialated);

%%
% label_str = 'Tracking...';
% [Labled_Image, Index_No] = bwlabel( IDialated );
% Img_Props = regionprops(Labled_Image); 
% Img_Box = [Img_Props.BoundingBox];
% Img_Box = reshape(Img_Box,[4 Index_No]);
% Image_Fin = insertObjectAnnotation(In, 'Rectangle', Img_Box, label_str);
% figure, imshow(Image_Fin);

%%
set(hImage, 'CData', IDialated);

%% 
drawnow;
clear Index_No;