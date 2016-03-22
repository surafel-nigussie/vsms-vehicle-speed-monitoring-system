function output = VSMS_ConnectedRegions( input1, input2 )

CC = bwconncomp(input1);
numPixels = cellfun(@numel,CC.PixelIdxList);
for counter = 1:input2
    lbl_pixel = numPixels(1,counter);
    if ( lbl_pixel > 25000 )
        input1(CC.PixelIdxList{counter}) = 0;
    end
    output = input1;
end
subplot(3,3,7); imshow(output);

end

