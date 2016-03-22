function output = VSMS_Lable( input )

[img_labled, Index] = bwlabel( input );
img_props = regionprops(img_labled); 
img_box = [img_props.BoundingBox]; 
img_box = reshape(img_box,[4 Index]);
for count = 1:Index 
    rectangle('position',img_box(:,count),'edgecolor','r'); 
end
output = Index;
end

