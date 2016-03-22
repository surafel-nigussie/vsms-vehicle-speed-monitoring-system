%% Creating Time-Lapse Video Using a Noncontiguous Acquisition
%
% This example shows how to create a time-lapse video without using all the frames of the acquisition.
%
% The Image Acquisition Toolbox(TM) makes it easy to produce time-lapse
% video.  The most efficient way to do time-lapse acquisition is to use the
% Image Acquisition Toolbox's built-in ability to log frames directly to an
% AVI file, and its ability to perform time decimation by retaining only a
% fraction of all the frames acquired by the camera.
%
% <matlab:playbackdemo('timelapsevideo','toolbox/imaq/web/demos'); Watch a day long
% time-lapse sequence>. (21 seconds)
%
% Copyright 2005-2014 The MathWorks, Inc.


%% Create a Video Input Object
% Before acquiring images using the Image Acquisition Toolbox, 
% create a video input object.

% When executing the following code, you may need to 
% modify it to match your acquisition hardware.
vid = videoinput('winvideo',1,'RGB24_352x288');

%% Determine the Frame Rate
% Most devices do not allow you to control their frame rate.  It is
% best to determine the frame rate experimentally by acquiring frames
% and analyzing the time stamps of the frames.
vid.FramesPerTrigger = 100;
start(vid);
wait(vid,Inf);

% Retrieve the frames and timestamps for each frame.
numframes = vid.FramesAvailable;
[frames,time] = getdata(vid,numframes);

% Calculate the frame rate by taking the average difference
% between the timestamps for each frame.
framerate = mean(1./diff(time))

%% Specify the Noncontiguous Acquisition
% The |FrameGrabInterval| property specifies how often frames are
% stored from the video stream.  For instance, if we set it to 5, then
% only 1 in 5 frames is kept - the other 4 frames will be discarded.

% We want to compress 30 seconds into 3 seconds, so 
% only acquire every tenth frame.
vid.FrameGrabInterval = 10;

%% Determine the Number of Frames to Acquire
% To determine how many frames to acquire in total, calculate the total
% number of frames that would be acquired at the device's frame rate, and
% then divide by the |FrameGrabInterval|.
capturetime = 30;
interval = vid.FrameGrabInterval;
numframes = floor(capturetime * framerate / interval)

%%
vid.FramesPerTrigger = numframes;

%% Configure AVI Disk Logging
% Due to the large number of frames that will be acquired, it is more
% practical to log the images to disk rather than to memory.  Using the
% Image Acquisition Toolbox, you can log images directly to an AVI file.
% We configure this using the |LoggingMode| property.
vid.LoggingMode = 'disk';

%%
% Create a VideoWriter object to log to, using the |VideoWriter| command.  
% We must specify the filename to use, and then set frame rate that the AVI
% file should be played back at.  Then, set the |DiskLogger| property of
% the video input object to the VideoWriter object.
vwObj = VideoWriter('timelapsevideo', 'Uncompressed AVI');
vwObj.FrameRate = framerate;
vid.DiskLogger = vwObj;
vid

%% Perform the Time-Lapse Acquisition
% Start the time-lapse acquisition, and wait for the
% acquisition to complete.  Note that the Image Acquisition
% Toolbox does not tie up MATLAB(R) while it is acquiring.  You
% can start the acquisition and keep working in MATLAB.  
start(vid);

% Wait for the capture to complete before continuing.  
wait(vid,Inf);

%% Close the AVI File
% Once the capture is completed, retrieve the VideoWriter object, and use
% the |close| function to release the resources associated with it.
vwObj = vid.DiskLogger;
close(vwObj);

%% Play Back the Time-Lapse AVI Sequence
% To play back the time-lapse AVI sequence, right-click on
% the filename in the MATLAB Current Folder browser, and choose
% Open Outside MATLAB from the context menu.

%% Clean Up
% When you are done with the video input object, you should
% use the |delete| function to free the hardware resources associated with
% it, and remove it from the workspace using the |clear| function.
delete(vid);
clear vid;


displayEndOfDemoMessage(mfilename)
