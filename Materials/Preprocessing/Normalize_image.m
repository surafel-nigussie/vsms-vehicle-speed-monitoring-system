img = imread('car-plate (1).jpg');
img = rgb2gray(img);
normalizedImage = uint8(255*mat2gray(img));
imshow(normalizedImage);