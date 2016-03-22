function output = VSMS_Dialate( input )

se = strel('square',20); 
output = imdilate(input, se); 
subplot(3,3,6); imshow(output);

end

