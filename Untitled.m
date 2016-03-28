% % vid_obj = videoinput('winvideo',2,'YUY2_640x480');
% vid_obj = videoinput('winvideo');
% vid_obj.FrameGrabInterval = 1; 
% vid_obj.ReturnedColorspace = 'rgb';
% start(vid_obj);
% while islogging(vid_obj);
%     data = preview(vid_obj);
%     imshow(data);
% end

figure('Name', 'My Custom Preview Window'); 
uicontrol('String', 'Close', 'Callback', 'close(gcf)');  
% Create an image object for previewing.
obj = videoinput('winvideo');
vidRes = obj.VideoResolution; 
nBands = obj.NumberOfBands; 
hImage = image( zeros(vidRes(2), vidRes(1), nBands) ); 
preview(obj, hImage); 