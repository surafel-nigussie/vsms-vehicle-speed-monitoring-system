
%%
In = imread('C:\Users\Surafel Nigussie\Documents\Matlab\Images\BGSUBT (1).JPG');
Ib = imread('C:\Users\Surafel Nigussie\Documents\Matlab\Images\BGSUBT (2).JPG');
% figure, imshow(In);

%%
INgray=rgb2gray(In);
IBgray=rgb2gray(Ib);
% figure, imshow(IBgray);

%%
INint16 = im2int16(INgray);
IBint16 = im2int16(IBgray);
% figure, imshow(INgray);

%%
Isubt=imsubtract(IBgray,INgray);
figure, imshow(Isubt);

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
figure, imshow(Ivalues);

%%
Ibwopen = bwareaopen(Ivalues, 200);
Ifill = imfill(Ibwopen,'holes');
figure, imshow(Ifill);

%%
se = strel('square',20); 
IDialated = imdilate(Ifill, se); 
figure, imshow(IDialated);

%%
% % % figure, imshow(IDialated); %Bounding box generated below can only be viewed if this frame is opened
% % % [img_labled, Index] = bwlabel( IDialated );
% % % Img_Props = regionprops(img_labled); 
% % % Img_Box = [Img_Props.BoundingBox]; 
% % % Img_Box = reshape(Img_Box,[4 Index]);
% % % for count = 1:Index 
% % %     rectangle('position',Img_Box(:,count),'edgecolor','r'); 
% % % end

%%
label_str = 'Tracking...';
[Labled_Image, Index] = bwlabel( IDialated );
Img_Props = regionprops(Labled_Image); 
Img_Box = [Img_Props.BoundingBox];
% Image_Fin = insertShape(In, 'Rectangle', Img_Box, 'Color', 'green');
Image_Fin = insertObjectAnnotation(In, 'Rectangle', Img_Box, label_str);
figure, imshow(Image_Fin);
