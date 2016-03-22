camList = webcamlist;
cam = webcam(1);
%preview(cam);
%img = snapshot(cam);
%imshow(img);
vidWriter = VideoWriter('framess.avi');
open(vidWriter);
for index = 1:20

% Acquire frame for processing
img = snapshot(cam);
% Write frame to video
writeVideo(vidWriter, img);
end