
function varargout = Home(varargin)
% HOME MATLAB code for Home.fig
%      HOME, by itself, creates a new HOME or raises the existing
%      singleton*.
%
%      H = HOME returns the handle to a new HOME or the handle to
%      the existing singleton*.
%
%      HOME('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HOME.M with the given input arguments.
%
%      HOME('Property','Value',...) creates a new HOME or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Home_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Home_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Home

% Last Modified by GUIDE v2.5 22-Apr-2016 08:23:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 0;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Home_OpeningFcn, ...
                   'gui_OutputFcn',  @Home_OutputFcn, ...
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


% --- Executes just before Home is made visible.
function Home_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Home (see VARARGIN)

% Choose default command line output for Home
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Home wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Home_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Get default command line output from handles structure
varargout{1} = handles.output;

%  To set the layout view of figure to fullsize
set(gcf, 'units','normalized','outerposition',[0 0 1 1]);

% --- Executes on selection change in listbox_availablecamera.
function listbox_availablecamera_Callback(hObject, eventdata, handles)
% hObject    handle to listbox_availablecamera (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox_availablecamera contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox_availablecamera


% --- Executes during object creation, after setting all properties.
function listbox_availablecamera_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox_availablecamera (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in get_camera_button.
function get_camera_button_Callback(hObject, eventdata, handles)
% hObject    handle to get_camera_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.listbox_availablecamera, 'String', []);
camlist = webcamlist;
for i=1 : length(camlist)
    webc = webcam(i);
    new_cam = char(webc.name);
    prv_cam = get(handles.listbox_availablecamera, 'String');
    cam_list = strvcat(prv_cam, new_cam);
    set(handles.listbox_availablecamera, 'String', cam_list);
end
clear webc;

% --- Executes on button press in preview_button.
function preview_button_Callback(hObject, eventdata, handles)
% hObject    handle to preview_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear cam_slctd;
val = get(handles.listbox_availablecamera,'Value');
cam_slctd = webcam(val);
cam_slctd.Resolution = '640x480';
imshow(snapshot(cam_slctd), 'Parent', handles.axes1);


% --- Executes when figure1 is resized.
function figure1_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in getVideo_button.
function getVideo_button_Callback(hObject, eventdata, handles)
% hObject    handle to getVideo_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.videoInputList, 'String', []);
vidInputDevice = webcamlist;
for i=1 : length(vidInputDevice)
    webc = webcam(i);
    new_Vid = char(webc.name);
    prv_Vide = get(handles.videoInputList, 'String');
    cam_list = strvcat(prv_Vide, new_Vid);
    set(handles.videoInputList, 'String', cam_list);
end
clear webc;

% --- Executes on button press in previewVideo.
function previewVideo_Callback(hObject, eventdata, handles)
%%
% hObject    handle to previewVideo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1); cla; 
% Get threshold
pop = str2double(get(handles.pop,'String'));
% Verify whether threshold is numerical value
if pop < 0 || isnan(pop) || isempty(pop)
    errordlg('Input numerical value','ERROR')
    return
end
% User data 0 (1 stop capture)
set(handles.stop,'UserData',0)
% Get video source and background
bg = handles.backg;
global id es_web_ext;

if es_web_ext == 0
    format = 'YUY2_640x480';
else
    format = 'RGB24_640x480';
end

%Create the video object
try
    vid = videoinput('winvideo', id, format);
    guidata(hObject, handles);
catch
    msgbox('Check the connection of the camera','Camera')
    set(handles.axes1,'XTick',[ ],'YTick',[ ])
end
    % Specify how often to acquire frame from video stream
    vid.FrameGrabInterval = 2;
    set(vid,'TriggerRepeat',Inf);
    start(vid);
    handles.vid = vid;
    count = 0;
%A loop for each new frame received from the camera, also counts the number
%of frames arrived
while islogging(vid)
    if get(handles.stop,'UserData') % Data from "Stop" button
        break
    end
    % Get image
    if es_web_ext == 0
        get_image = ycbcr2rgb(getdata(vid, 1));
    else
        get_image = getdata(vid, 1);
    end
    % Show image
    image(get_image);
    % Convert image to double
    input_image = double(get_image);
    axis image off;
    % Call "compare" function
    if( compare(input_image,bg,pop))
        count = count + 1;
        img = getsnapshot(vid);
        img = ycbcr2rgb(img); %remove noise 
        if((count>30 )&&(count<50))
            imwrite(img, strcat('snap',num2str(count), '.png'));                             
        end
    end
    drawnow;
end
stop(vid);
delete(vid);
clear vid;
imaqreset;
% User data 0 (1 stop capture)
set(handles.stop,'UserData',0);
guidata(hObject, handles);

% --- Executes on selection change in videoInputList.
function videoInputList_Callback(hObject, eventdata, handles)
% hObject    handle to videoInputList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns videoInputList contents as cell array
%        contents{get(hObject,'Value')} returns selected item from videoInputList


% --- Executes during object creation, after setting all properties.
function videoInputList_CreateFcn(hObject, eventdata, handles)
% hObject    handle to videoInputList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in get_background_btn.
function get_background_btn_Callback(hObject, eventdata, handles)
% hObject    handle to get_background_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% selectedcam = webcam(1);
% selectedcam.Resolution = '1280x720';
% handles.bgimage = snapshot(selectedcam);
% imshow(handles.bgimage, 'Parent', handles.axes1);
% clear selectedcam;
% guidata(hObject,handles);
axes(handles.axes1); cla; 
imaqreset;
set(hObject,'UserData',0) %User data 0 (1 stop capture)
% Enable "Start" and "Stop" buttons
% set(handles.uipanel3,'visible','off');
% Disable current button
% set(hObject,'Enable','off');
% Get default source
      
        % Open GUI to select the camera to use
        sel_camera;
        %
        uiwait;
        % Bring the camera features
        % id = Camera ID
        % es_web_ext = indicator if laptop or external camera
        global id es_web_ext;
        % Determine format depending on the type of camera to use
        if es_web_ext == 0
            formt = 'YUY2_640x480';
        else
            formt = 'RGB24_640x480';
            %formt='RGB24_320x240';
        end
        try
            % Create video object
            vid = videoinput('winvideo', id, formt);
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
        if es_web_ext == 0
            bgImage = double(ycbcr2rgb(data(:,:,:,50)));
        else
            bgImage = double(data(:,:,:,50));
        end
        % Set last image as background
        % Show background
        imshow(uint8(bgImage));
        % Reset video object
        stop(vid);
        clear vid;
        imaqreset;
    
% Save background
handles.backg=bgImage;
guidata(hObject,handles);

% --- Executes on button press in clear_axis_btn.
function clear_axis_btn_Callback(hObject, eventdata, handles)
% hObject    handle to clear_axis_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla;


% --- Executes on button press in Camera.
function Camera_Callback(hObject, eventdata, handles)
% hObject    handle to Camera (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Camera


% --- Executes on button press in stop.
function stop_Callback(hObject, eventdata, handles)
% hObject    handle to stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject,'userdata',1);
guidata(hObject, handles);



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object deletion, before destroying properties.
function uipanel5_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to uipanel5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function pop_Callback(hObject, eventdata, handles)
% hObject    handle to pop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pop as text
%        str2double(get(hObject,'String')) returns contents of pop as a double


% --- Executes during object creation, after setting all properties.
function pop_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
