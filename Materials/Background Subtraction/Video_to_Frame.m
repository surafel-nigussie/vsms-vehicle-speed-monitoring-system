%%
%Create a reader for the video file
reader = VideoReader('stream.avi', 'tag', 'myreader1');
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
%
clear all;
clc;