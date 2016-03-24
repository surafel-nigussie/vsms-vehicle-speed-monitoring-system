vid_Selection = imaqhwinfo;
vid_val = 1;
vid = videoinput(char(vid_Selection(1).InstalledAdaptors), 1, 'MJPG_1280x720');
% axes(handles.axes1);
start(vid);
while islogging(vid);
    img = getdata(vid,1);
    imshow(img);
end