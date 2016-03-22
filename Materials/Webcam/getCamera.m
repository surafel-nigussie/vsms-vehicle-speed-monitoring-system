camlist = webcamlist;
for i=1 : length(camlist)
    cam = webcam(i);
    cam.name
end