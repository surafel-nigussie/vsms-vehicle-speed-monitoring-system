clear all;
S1       = imread('car-plate (5).jpg');
S2       = rgb2gray(S1);
S3       = medfilt2(S2, [3 3]);
E1       = edge(S3, 'sobel'); 
[sx, sy] = size(E1);
E2       = imdilate(E1, ones(3));
L        = bwlabel(E2, 8);
N        = 4;
[yN, xN]  = find(L == N);  
G        = zeros(sx, sy); 

for i = 1:length(yN)
    G(yN(i), xN(i)) = 255;
end

imwrite(G, 'ergebnis.jpg', 'jpg');
subplot(2,2,1); imshow(S1);    title('Original Image');
subplot(2,2,2); imshow(E1);    title('Filtered b/w Image');
subplot(2,2,3); imshow(E2);    title('Smoothed Edges');
subplot(2,2,4); imshow(G,[]); title('Chosen Object');