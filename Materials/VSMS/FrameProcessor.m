function FrameProcessor(obj,event,hImage)
%%
In = event.Data;
Ib = getappdata(hImage,'HandleToBackgroundImage');

%%
INgray=rgb2gray(In);
IBgray=rgb2gray(Ib);
% figure, imshow(INgray);

%%
Isubt=imsubtract(IBgray,INgray);
% figure, imshow(Isubt);

%%
[r,c] = size(Isubt);
Ivalues = zeros(r,c);
for i = 1:r
    for j = 1:c
        if Isubt(i,j) > 10
            Ivalues(i,j) = 1;
        end
    end
end
% figure, imshow(Ivalues);

% %%
% Ibwopen = bwareaopen(Ivalues, 200);
% Ifill = imfill(Ibwopen,'holes');
% % figure, imshow(Ifill);
% 
% %%
% se = strel('square',20); 
% IDialated = imdilate(Ifill, se); 
% % figure, imshow(IDialated);
% 
% %%
% [Labled_Image, Index] = bwlabel( IDialated );
% Img_Props = regionprops(Labled_Image); 
% Img_Box = [Img_Props.BoundingBox];
% Image_Fin = insertShape(In, 'Rectangle', Img_Box, 'Color', 'green');

%%
set(hImage, 'CData', Ivalues);

%% 
drawnow;