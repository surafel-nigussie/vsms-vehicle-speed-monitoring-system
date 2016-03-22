function output = VSMS_Thresholding ( input1, input2 )

[r,c] = size(input1);
output = zeros(r,c);
for i = 1:r
    for j = 1:c
        if input1(i,j) > input2
            output(i,j) = 1;
        end
    end
end
subplot(3,3,4); imshow(output);

end
