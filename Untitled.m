vid_obj = videoinput('winvideo',2,'YUY2_640x480');
vid_obj.FrameGrabInterval = 1; 
vid_obj.ReturnedColorspace = 'rgb';
start(vid_obj);
while islogging(vid_obj);
    data = getsnapshot(vid_obj);
    imshow(data);
end
