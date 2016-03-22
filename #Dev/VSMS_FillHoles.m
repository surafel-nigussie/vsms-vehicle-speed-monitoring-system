function output = VSMS_FillHoles( input )

img_clean = bwareaopen(input, 12000);
output = imfill(img_clean,'holes');
subplot(3,3,5); imshow(output);

end

