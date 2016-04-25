%%
Ib = imread('Images/Background.jpg');
In = imread('Images/Image.jpg');

%%
INgray=rgb2gray(In);
IBgray=rgb2gray(Ib);
figure, imshow(IBgray);
figure, imshow(INgray);

%%
Isubt=imsubtract(IBgray,INgray);
figure, imshow(Isubt);

%%
[r,c] = size(Isubt);
Ivalues = zeros(r,c);
for i = 1:r
    for j = 1:c
        if Isubt(i,j) > 25
            Ivalues(i,j) = 1;
        end
    end
end
Ibwopen = bwareaopen(Ivalues, 5);
Ifill = imfill(Ibwopen,'holes');
figure, imshow(Ifill);
