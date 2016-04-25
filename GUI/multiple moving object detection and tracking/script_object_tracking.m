% Object Tracking via WebCam
% ________________________________________
% Close all windows, clear workspace
clc, cla, close all
% Disconnect and delete all image acquisition objects
imaqreset
% Create video input object
vid = videoinput('winvideo', 1);
% Specify how often to acquire frame from video stream
vid.FrameGrabInterval = 2;
set(vid,'TriggerRepeat',Inf);
reso=vid.VideoResolution;
% _______Get Background_________
disp('Get Background')
vid.FramesPerTrigger=50;
start(vid);
data = getdata(vid,50);
background=double(data(:,:,:,50));
disp('END Get Background')
% _____________________________
% try    
    threshold=60;
    figure(1);     
    while (vid.FramesAcquired<350)        
        % Get image
        imagen = getdata(vid,2);        
        imshow(imagen)   
        title('OBJECT TRACKING WITH background substraction ')
                 
        input_image = double(imagen);
        %
        [indicador] = compare(input_image,background,threshold);%                                    
    end        
    stop(vid);
    delete vid
    clear vid
% catch
%     stop(vid);
%     disp('Sucedió un ERROR')
% end
clc
disp('END')
% Disconnect and delete all image acquisition objects
imaqreset