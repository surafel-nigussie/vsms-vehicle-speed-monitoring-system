%%Create a live streaming video input directly from the camera
vid = videoinput('winvideo', 1, 'MJPG_1280x720');
src = getselectedsource(vid);
vid.FramesPerTrigger = 220;

% vid.LoggingMode = 'disk';
vidWriter = VideoWriter('C:\Users\Surafel Nigussie\Documents\MATLAB\Live Stream\stream2.avi');
open(vidWriter);
% preview(vid);
start(vid);
% wait(vid,Inf);
while islogging(vid);
    img = getdata(vid,1);
    writeVideo(vidWriter, img);
end

%%
%Create a reader for the video file
reader = VideoReader('C:\Users\Surafel Nigussie\Documents\MATLAB\Live Stream\stream2.avi', 'tag', 'myreader1');
%Read video file
video = read(reader);
%%% implay(video);
%Get number of frames from the video
num_frames = get(reader, 'NumberOfFrames');
%Frames image file extension
str = '.bmp';
%Iterate through the video
for k = 1 : num_frames-1
    mov(k).cdata = video(:,:,:,k);
    mov(k).colormap = [];
    frames = video(:,:,:,k);
    frame_file_name = strcat(num2str(k),str);
    imwrite(frames, frame_file_name);
end 

%% 
clear all;
clc;
