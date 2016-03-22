%select image acquisition tool
vid = videoinput('winvideo', 1, 'YUY2_1280x720');

%select video writer
vidWriter = VideoWriter('.avi');

%select camera
camList = webcamlist;
cam = webcam(1);

try 
    set(vid,'framesperTrigger',10,'TriggerRepeat',Inf);
    %Start live stream acwuisition
    start(vid);
    %Open video writer
    open(vidWriter);
    
    while islogging(vid);
        %Acquire frame for processing
        img = snapshot(cam);
        %Write frame to video
        writeVideo(vidWriter, img);
    end
    
catch 
    
end

