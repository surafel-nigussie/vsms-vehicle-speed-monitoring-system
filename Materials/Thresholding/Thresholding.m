function I = Thresholding(img)
[r,c] = size(img);
I = zeros(r,c);
for i = 1:r
    for j = 1:c
        if img(i,j) > 125
            I(i,j) = 1;
        end
    end
end
I = bwareaopen(I, 3000);
I = imfill(I,'holes');
end