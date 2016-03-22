function VSMS_PlateBorder( input )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[Img_label2, Indexed] = bwlabel(input);
Img_prop = regionprops(Img_label2); 
Img_Boxs = [Img_prop.BoundingBox]; 
Img_Boxs = reshape(Img_Boxs,[4 Indexed]);
for countr = 1:Indexed 
    rectangle('position',Img_Boxs(:,countr),'edgecolor','g'); 
end

end

