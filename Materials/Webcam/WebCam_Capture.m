%%
%LIst available cameras
webcamlist;

%%
%select default computer webcam
cam = webcam(1);

%%
%List available resolution
cam.AvailableResolutions

%%
%Select resolution
cam.Resolution = '640x480';

%%
%Take a snapshot
img = snapshot(cam);

%%
imshow(img);