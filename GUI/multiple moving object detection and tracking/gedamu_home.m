function varargout = gedamu_home(varargin)
% GEDAMU_HOME MATLAB code for gedamu_home.fig
%      GEDAMU_HOME, by itself, creates a new GEDAMU_HOME or raises the existing
%      singleton*.
%
%      H = GEDAMU_HOME returns the handle to a new GEDAMU_HOME or the handle to
%      the existing singleton*.
%
%      GEDAMU_HOME('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GEDAMU_HOME.M with the given input arguments.
%
%      GEDAMU_HOME('Property','Value',...) creates a new GEDAMU_HOME or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gedamu_home_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gedamu_home_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gedamu_home

% Last Modified by GUIDE v2.5 30-Mar-2015 11:49:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gedamu_home_OpeningFcn, ...
                   'gui_OutputFcn',  @gedamu_home_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT
%% 


% --- Executes just before gedamu_home is made visible.
function gedamu_home_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gedamu_home (see VARARGIN)
movegui(hObject,'center')
imaqreset
% ID of video source
handles.x=2;
% Choose default command line output for gedamu_home

set(handles.axes1,'Visible','off');
set(handles.axes2,'Visible','off');
set(handles.uipanel3,'visible','off');
set(handles.uipanel8,'visible','on');
set(handles.uipanel4,'visible','off');
set(handles.take_snapshot,'visible','off');
set(handles.take_video,'visible','off');
set(handles.text2,'visible','off');
set(handles.text3,'visible','off');
set(handles.text4,'visible','off');
set(handles.text,'visible','off');
set(handles.dc,'visible','off');
set(handles.stop_capture,'visible','off');
set(handles.set,'enable','off');
set(handles.take_shot,'enable','off');
set(handles.start_realtime,'enable','off');
set(handles.start_image,'enable','off');

set(hObject,'UserData',0)
set(handles.axes1,'XTickLabel',[],'YTickLabel',[])
% Choose default command line output for object_tracking
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);



% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gedamu_home wait for user response (see UIRESUME)
% uiwait(handles.figure1);



% --- Outputs from this function are returned to the command line.
%% 

function varargout = gedamu_home_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
%varargout{1} = handles.output;
varargout{1} = handles.output;

%% 



% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.axes1,'Visible','off');
set(handles.axes2,'Visible','off');
set(handles.uipanel3,'visible','off');
set(handles.uipanel4,'visible','off');
set(handles.uipanel8,'visible','on');
set(handles.take_snapshot,'visible','off');
set(handles.take_video,'visible','off');
set(handles.text2,'visible','off');
set(handles.text3,'visible','off');
set(handles.text4,'visible','off');
set(handles.text,'visible','off');
set(handles.dc,'visible','off');
set(handles.stop_capture,'visible','off');
set(handles.set,'enable','off');
set(handles.take_shot,'enable','off');
set(handles.start_realtime,'enable','off');
set(handles.start_image,'enable','off');

%% 

% --- Executes on button press in exit.
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close


% --- Executes on button press in take_snapshot.
function take_snapshot_Callback(hObject, eventdata, handles)
% hObject    handle to take_snapshot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

axes(handles.axes1); cla;

      i=1;
while(i<2)
   
   
       am=imread('snap31.png');
       imshow(am);
   pause(1);
     am=imread('snap32.png');
       imshow(am);
  pause(1);
    am=imread('snap35.png');
       imshow(am);
   pause(1);
   am=imread('snap38.png');
       imshow(am);
   pause(1);
   am=imread('snap39.png');
       imshow(am);
   pause(1);
   am=imread('snap40.png');
       imshow(am);
   pause(1);
   am=imread('snap42.png');
       imshow(am);
       pause(1);
       am=imread('snap45.png');
       imshow(am);
       pause(1);
       am=imread('snap47.png');
       imshow(am);
   pause(1);
   i=i+1;
end

% --- Executes on button press in take_video.
function take_video_Callback(hObject, eventdata, handles)
% hObject    handle to take_video (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    
    


% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes2); cla; 
set(handles.take_snapshot,'visible','on');
set(handles.take_video,'visible','on');
set(handles.start,'visible','on');
set(handles.text,'visible','on');
% Get threshold
pop=str2double(get(handles.pop,'String'));
% Verify whether threshold is numerical value
if pop<0 || isnan(pop) || isempty(pop)
    errordlg('Input numerical value','ERROR')
    return
end
% User data 0 (1 stop capture)
set(handles.stop,'UserData',0)
% Get video source
sel_source=handles.x;
%Get background
bg=handles.backg;
% _____________________________
switch sel_source
    case 1 % WEB CAM        
        global id es_web_ext
        
        if es_web_ext==0
            format='YUY2_176x144';
        else
            format='RGB24_320x240';
        end
        try
            vid = videoinput('winvideo',id,format);
            
            guidata(hObject, handles);
        catch
            msgbox('Check the connection of the camera','Camera')
            set(handles.axes1,'XTick',[ ],'YTick',[ ])
        end
        % Specify how often to acquire frame from video stream
        vid.FrameGrabInterval =2;
        set(vid,'TriggerRepeat',Inf);
        %Start capture
        %  try
        start(vid);
        handles.vid=vid;
        count=0;
        while 1
            if get(handles.stop,'UserData') % Data from "Stop" button
                break
            end
            % Get image
            if es_web_ext==0
                get_image = ycbcr2rgb(getdata(vid,1));
            else
                get_image = getdata(vid,1);
            end
            % Show image
            image(get_image)
            % Convert image to double
            input_image = double(get_image);
            axis image off
            % Call "compare" function
            if( compare(input_image,bg,pop))
                count=count+1;
                im=getsnapshot(vid);
                img=ycbcr2rgb(im);%remove noise 
                if((count>30 )&&(count<50))
                    
                        imwrite(img,strcat('snap',num2str(count),'.png'));
                                                   
                end
                
            end
            
            drawnow
        end
        stop(vid);
        delete(vid)
        clear vid
        imaqreset
        % _________________________________________________________________
    case 2 % VIDEO AVI        
        nFrames = handles.xyloObj.NumberOfFrames;
        for cnt = 1:2:nFrames
            if get(handles.stop,'UserData')% Stop whether "stop" button is pressed
                break
            end
            % Show image
            the_image=read(handles.xyloObj,cnt);
            image(the_image);
            axis image off
            input_image=double(the_image);
            %handles.input_image=input;
            % Call "compare" function
           compare(input_image,bg,pop);
            
            drawnow;
        end        
end

    
% Enable "Start"  button
set(handles.take_snapshot,'visible','on');
set(handles.take_video,'visible','on');
set(handles.start,'visible','on');
% User data 0 (1 stop capture)
set(handles.stop,'UserData',0)


guidata(hObject, handles);



% --- Executes on selection change in pop.
function pop_Callback(hObject, eventdata, handles)
% hObject    handle to pop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pop contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pop


% --- Executes during object creation, after setting all properties.
function pop_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in stop.
function stop_Callback(hObject, eventdata, handles)
% hObject    handle to stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject,'userdata',1)
guidata(hObject, handles)

% --- Executes on button press in get_background.
function get_background_Callback(hObject, eventdata, handles)
axes(handles.axes1); cla; 
imaqreset
set(hObject,'UserData',0) %User data 0 (1 stop capture)
% Enable "Start" and "Stop" buttons
set(handles.uipanel3,'visible','off');
% Disable current button
set(hObject,'Enable','off');
% Get default source
sel_source=handles.x;
switch sel_source
    % _________________________________________________________________
    case 1 %WEB CAM        
        % Open GUI to select the camera to use
        sel_camera
        %
        uiwait
        % Bring the camera features
        % id= Camera ID
        % es_web_ext= indicator if laptop or external camera
        global id es_web_ext
        % Determine format depending on the type of camera to use
        if es_web_ext==0
            formt='YUY2_176x144';
        else
            formt='RGB24_320x240';
        end
        try
            % Create video object
            vid = videoinput('winvideo',id,formt);
            % Update handles
            guidata(hObject, handles);            
        catch
            % Message on error
            msgbox('Check the connection of the camera','Camera')
            % Remove axis labels
            set(handles.axes1,'XTick',[ ],'YTick',[ ])
        end
        % Specify how often to acquire frame from video stream
        vid.FrameGrabInterval = 1;
        set(vid,'TriggerRepeat',Inf);
        % Start capture
        % _______Get Background_________
        vid.FramesPerTrigger=50;
        start(vid);
        data = getdata(vid,50);
        if es_web_ext==0
            bgImage=double(ycbcr2rgb(data(:,:,:,50)));
        else
            bgImage=double(data(:,:,:,50));
        end
        % Set last image as background
        % Show background
        imshow(uint8(bgImage))
        % Reset video object
        stop(vid);
        clear vid
        imaqreset
    case 2%VIDEO AVI
        [nombre, ruta]=uigetfile('*.avi','SELECT VIDEO AVI');
        if nombre == 0 %If press cancel button, return
          set(hObject,'Enable','on');
           set(handles.start,'Enable','on');
           set(handles.stop,'Enable','on');
            return
        end
        %------------------------------------------
      %  handles.xyloObj = VideoReader(fullfile(ruta,nombre));
        handles.xyloObj = VideoReader('viptraffic.avi');
      %handles.xyloObj = VideoReader('atrium.avi');
        axes(handles.axes1)
        %Show image
        bgImage=double(read(handles.xyloObj,10));
        imagesc(uint8(bgImage))
        axis image off
       % handles.ruta=ruta;
        %handles.nombre=nombre;
end
% Save background
handles.backg=bgImage;
guidata(hObject,handles)
% Enable buttons
set(handles.text2,'visible','on');
set(handles.text3,'visible','on');
set(handles.uipanel3,'visible','on');
set(hObject,'Enable','on');

% --- Executes when selected object is changed in uipanel1.
function uipanel1_SelectionChangeFcn(hObject, eventdata, handles)
if hObject==handles.video %VIDEO AVI
    handles.x=2;
else
    handles.x=1;    % WEBCAM
end

guidata(hObject,handles)


% --- Executes on button press in stop_capture.
function stop_capture_Callback(hObject, eventdata, handles)
% hObject    handle to stop_capture (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
vid=handles.vid;
 stop(vid);
    
        if(exist('UAV_datalog.avi')==2)
        disp('AVI file created.')
        end
    


% --- Executes during object creation, after setting all properties.
function text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in color.
function color_Callback(hObject, eventdata, handles)
% hObject    handle to color (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel4,'visible','on');
set(handles.uipanel8,'visible','off');
set(handles.uipanel6,'visible','off');
set(handles.uipanel7,'visible','off');
set(handles.uipanel5,'visible','off');
set(handles.real_time,'enable','on');
set(handles.use_image,'enable','on');
set(handles.popupmenu2,'enable','off');
set(handles.start_realtime,'enable','off');
set(handles.start_image,'enable','off');

% --- Executes on button press in use_image.
function use_image_Callback(hObject, eventdata, handles)
% hObject    handle to use_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.real_time,'enable','off');
set(handles.uipanel5,'visible','on');


% --- Executes on button press in real_time.
function real_time_Callback(hObject, eventdata, handles)
% hObject    handle to real_time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.use_image,'enable','off');
set(handles.popupmenu2,'enable','on');

% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val=get(hObject,'Value');
switch val
    case 1
        warndlg('Please select a frame value');
        set(handles.set,'enable','off');
    case 2  
        handles.frame=25;
        set(handles.set,'enable','on');
          case 3 
        handles.frame=50;
        set(handles.set,'enable','on');
          case 4  
        handles.frame=100;
        set(handles.set,'enable','on');
          case 5  
        handles.frame=150;
        set(handles.set,'enable','on');
          case 6  
        handles.frame=200;
        set(handles.set,'enable','on');
          case 7  
        handles.frame=300;
        set(handles.set,'enable','on');
          case 8  
        handles.frame=400;
        set(handles.set,'enable','on');
end
guidata(hObject,handles);
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in take_shot.
function take_shot_Callback(hObject, eventdata, handles)
% hObject    handle to take_shot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.im=getsnapshot(handles.vid);
handles.rgb=ycbcr2rgb(handles.im);
axes(handles.axes1); cla; imshow(handles.rgb);
closepreview(handles.vid);
guidata(hObject,handles);

% --- Executes on button press in start_image.
function start_image_Callback(hObject, eventdata, handles)
% hObject    handle to start_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

im=handles.im; x=handles.x;
switch x
    case 1
        axes(handles.axes2); cla;
        im=handles.im;
r=im(:,:,1); g=im(:,:,2); b=im(:,:,3);
diff=imsubtract(r,rgb2gray(im));
 bw=im2bw(diff,0.18);
 area=bwareaopen(bw,300);
 rm=immultiply(area,r);  gm=g.*0;  bm=b.*0;
 image=cat(3,rm,gm,bm);
 imshow(image);
 
 case 2
        axes(handles.axes2); cla;
        im=handles.im;
r=im(:,:,1); g=im(:,:,2); b=im(:,:,3);
diff=imsubtract(g,rgb2gray(im));
 bw=im2bw(diff,0.18);
 area=bwareaopen(bw,300);
 gm=immultiply(area,g);  rm=r.*0;  bm=b.*0;
 image=cat(3,rm,gm,bm);
 imshow(image);
 case 3
        axes(handles.axes2); cla;
        im=handles.im;
r=im(:,:,1); g=im(:,:,2); b=im(:,:,3);
diff=imsubtract(b,rgb2gray(im));
 bw=im2bw(diff,0.18);
 area=bwareaopen(bw,300);
 bm=immultiply(area,b);  gm=g.*0;  rm=r.*0;
 image=cat(3,rm,gm,bm);
 imshow(image);
 end
 set(handles.dc,'visible','on');

% --- Executes on button press in start_realtime.
function start_realtime_Callback(hObject, eventdata, handles)
% hObject    handle to start_realtime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1); cla;
axes(handles.axes2); cla;

set(handles.dc,'visible','on');

h = waitbar(0,'Please wait...');
steps = 200;
for step = 1:steps
    % computations take place here
    waitbar(step / steps)
end
close(h)
switch handles.cv
    case 1
        imaqreset
        info= imaqhwinfo;
        name = char(info.InstalledAdaptors(end));
        c_info = imaqhwinfo(name);
        id = c_info.DeviceInfo.DeviceID(end);
        format = char(c_info.DeviceInfo.SupportedFormats(end));
        vid= videoinput(name, id, format);
         set(vid, 'FramesPerTrigger', Inf);
        set(vid, 'ReturnedColorspace', 'rgb')
        vid.FrameGrabInterval = 5;
        start(vid)
        % Set loop from the value of slider
                while(vid.FramesAcquired<=handles.val)
                % current snapshot
                im = getsnapshot(vid);
                r=im(:,:,1); g=im(:,:,2); b=im(:,:,3);
                diff=imsubtract(r,rgb2gray(im));
                bw=im2bw(diff,0.18);
                area=bwareaopen(bw,300);
                rm=immultiply(area,r);  gm=g.*0;  bm=b.*0;
                image=cat(3,rm,gm,bm);
                axes(handles.axes2);
                imshow(image);   
                axes(handles.axes1);
                imshow(im);
                end
                stop(vid);
                flushdata(vid);
                clear all
    case 2
         imaqreset
        info= imaqhwinfo;
        name = char(info.InstalledAdaptors(end));
        c_info = imaqhwinfo(name);
        id = c_info.DeviceInfo.DeviceID(end);
        format = char(c_info.DeviceInfo.SupportedFormats(end));
        vid= videoinput(name, id, format);
        set(vid, 'FramesPerTrigger', Inf);
        set(vid, 'ReturnedColorspace', 'rgb')
        vid.FrameGrabInterval = 5;
        start(vid)
        % Set loop from the value of slider
                while(vid.FramesAcquired<=handles.val)
                % current snapshot
                im = getsnapshot(vid);
                r=im(:,:,1); g=im(:,:,2); b=im(:,:,3);
                diff=imsubtract(g,rgb2gray(im));
                bw=im2bw(diff,0.18);
                area=bwareaopen(bw,300);
                gm=immultiply(area,g);  rm=r.*0;  bm=b.*0;
                image=cat(3,rm,gm,bm);
                axes(handles.axes2);
                imshow(image);
                axes(handles.axes1);
                imshow(im);
                end
                stop(vid);
                flushdata(vid);
                clear all
                
    case 3       
        imaqreset
        info= imaqhwinfo;
        name = char(info.InstalledAdaptors(end));
        c_info = imaqhwinfo(name);
        id = c_info.DeviceInfo.DeviceID(end);
        format = char(c_info.DeviceInfo.SupportedFormats(end));
        vid= videoinput(name, id, format);
        set(vid, 'FramesPerTrigger', Inf);
        set(vid, 'ReturnedColorspace', 'rgb')
        vid.FrameGrabInterval = 5;
        start(vid)
        % Set loop from the value of slider
                while(vid.FramesAcquired<=handles.val)
                % current snapshot
                im = getsnapshot(vid);
                r=im(:,:,1); g=im(:,:,2); b=im(:,:,3);
                diff=imsubtract(b,rgb2gray(im));
                bw=im2bw(diff,0.18);
                area=bwareaopen(bw,300);
                bm=immultiply(area,b);  gm=g.*0;  rm=r.*0;
                image=cat(3,rm,gm,bm);
                axes(handles.axes2);
                imshow(image);
                axes(handles.axes1);
                imshow(im);
                end
                stop(vid);
                flushdata(vid);
                clear all
end

% --- Executes on button press in set.
function set_Callback(hObject, eventdata, handles)
% hObject    handle to set (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.val=handles.frame;
guidata(hObject,handles);
set(handles.uipanel6,'visible','on');

% --- Executes on button press in red_realtime.
function red_realtime_Callback(hObject, eventdata, handles)
% hObject    handle to red_realtime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.text,'visible','on');
handles.cv=1;
guidata(hObject,handles);
set(handles.start_realtime,'enable','on');
set(handles.text,'string','Red color detecting ');
% --- Executes on button press in gren.
function gren_Callback(hObject, eventdata, handles)
% hObject    handle to gren (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text,'visible','on');
handles.x=2;
guidata(hObject,handles);
set(handles.start_image,'enable','on');
set(handles.text,'string','Gren color detecting ');

% --- Executes on button press in blue_realtime.
function blue_realtime_Callback(hObject, eventdata, handles)
% hObject    handle to blue_realtime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text,'visible','on');
handles.cv=3;
guidata(hObject,handles);
set(handles.start_realtime,'enable','on');
set(handles.text,'string','Blue color detecting ');
% --- Executes on button press in gren_realtime.
function gren_realtime_Callback(hObject, eventdata, handles)
% hObject    handle to gren_realtime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text,'visible','on');
handles.cv=2;
guidata(hObject,handles);
set(handles.start_realtime,'enable','on');
set(handles.text,'string','Gren color detecting ');
% --- Executes on button press in demo_image.
function demo_image_Callback(hObject, eventdata, handles)
% hObject    handle to demo_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1); cla;
str = {'RGB Wheel','RGB Balls','RGB Cube','Color Boxes'};
[Selection,ok] = listdlg('PromptString','Select an Image','SelectionMode','single','ListSize',[200 100],...
    'ListString',str);
if (ok==0)
    errordlg('You didnt select any image ','Selection Error');
end
switch Selection
    case 1
handles.im=imread('rgbwheel.jpg');
imshow(handles.im);
    case 2
        handles.im=imread('rgbballs.jpg');
imshow(handles.im);
case 3
        handles.im=imread('rgbcube.jpg');
imshow(handles.im);
case 4
        handles.im=imread('mcolor.jpg');
imshow(handles.im);
end
set(handles.uipanel2,'visible','on');    
set(handles.uipanel7,'visible','on');
set(handles.start_image,'visible','on');
guidata(hObject, handles);
%[s,v]=listdlg('PromptString','Select Iamge','SelectionMode','ListString',str);



% --- Executes on button press in browse_image.
function browse_image_Callback(hObject, eventdata, handles)
% hObject    handle to browse_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file path]=uigetfile({'*.jpg';'*.bmp';'*.jpeg';'*.png'}, 'Load Image File within Avilable Extensions');
image=[path file];
handles.file=image;
if (file==0)
    warndlg('You did not selected any file ') ; % fille is not selected
end
[fpath, fname, fext]=fileparts(file);
 validex=({'.bmp','.jpg','.jpeg','.png'});
 found=0;
 for (x=1:length(validex))
 if (strcmpi(fext,validex{x}))
     found=1;
handles.im=imread(image);
axes(handles.axes1); cla; 
h = waitbar(0,'Please wait...');
steps = 100;
for step = 1:steps
    % computations take place here
    waitbar(step / steps)
end
close(h) 
  end
 end
 imshow(handles.im);
if (found==0)
     errordlg('Selected file does not match available extensions. Please select file from available extensions [ .jpg, .jpeg, .bmp, .png] ','Image Format Error');
end
guidata(hObject, handles);
set(handles.uipanel7,'visible','on');
set(handles.start_image,'visible','on');

% --- Executes on button press in from_camera.
function from_camera_Callback(hObject, eventdata, handles)
% hObject    handle to from_camera (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imaqreset
info= imaqhwinfo;
name = char(info.InstalledAdaptors(end));
c_info = imaqhwinfo(name);
id = c_info.DeviceInfo.DeviceID(end);
format = char(c_info.DeviceInfo.SupportedFormats(end));
handles.vid= videoinput(name, id, format);
axes(handles.axes1);cla;
h = waitbar(0,'Please wait...');
steps = 200;
for step = 1:steps
    % computations take place here
    waitbar(step / steps)
end
close(h) 

preview(handles.vid);
set(handles.take_shot,'Enable','on');
guidata(hObject,handles);
set(handles.uipanel7,'visible','on');



% --- Executes on button press in red.
function red_Callback(hObject, eventdata, handles)
% hObject    handle to red (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text,'visible','on');
handles.x=1;
guidata(hObject,handles);
set(handles.start_image,'enable','on');
set(handles.text,'string','Red color detecting ');
% --- Executes on button press in blue.
function blue_Callback(hObject, eventdata, handles)
% hObject    handle to blue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text,'visible','on');
handles.x=3;
guidata(hObject,handles);
set(handles.start_image,'enable','on');
set(handles.text,'string','Blue color detecting ');
