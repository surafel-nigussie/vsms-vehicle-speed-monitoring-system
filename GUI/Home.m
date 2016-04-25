
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

% Last Modified by GUIDE v2.5 04-Apr-2016 10:40:01

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

% % To set the layout view of figure to fullsize
set(gcf, 'units','normalized','outerposition',[0 0 1 1]);
% % % % % Here we declare all the video and camera objects to be used in later
% % % handles.vid_obj_asus = videoinput('winvideo', 1, 'MJPG_1280x720');
% % % % handles.vid_obj_usb = videoinput('winvideo', 2, 'YUY2_640x480');
% % % handles.cam_obj_asus = webcam(1);
% % % % handles.cam_obj_usb = webcam(2);
% % % guidata(hObject,handles);

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
clear vid_obj;
cla;
value = get(handles.videoInputList,'Value');
if value == 1
    vid_obj = videoinput('winvideo', 1, 'MJPG_1280x720');
elseif value == 2
    vid_obj = videoinput('winvideo', 2, 'YUY2_640x480');
end
vid_obj.FrameGrabInterval = 1; 
vid_obj.ReturnedColorspace = 'rgb';
%Building image height and width from the camera resolution option
vidRes = vid_obj.VideoResolution; 
nBands = vid_obj.NumberOfBands; 
hImage = image( zeros(vidRes(2), vidRes(1), nBands) ); 
%Setting the function the will be called every time a new frame is received
setappdata(hImage,'UpdatePreviewWindowFcn',@FrameProcessor);
% setappdata(hImage,'UpdatePreviewWindowFcn',@vision_processor);
setappdata(hImage,'HandleToBackgroundImage',handles.bgimage);
setappdata(hImage,'HandleToAxis',handles.axes1);
setappdata(hImage,'HandleToHandle',handles);
dbtype('FrameProcessor.m')
%Gettting the axis that will be used to preview the incoming video stream
axes(handles.axes1);
%Start the camera preview
preview(vid_obj, hImage);


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
selectedcam = webcam(1);
selectedcam.Resolution = '1280x720';
handles.bgimage = snapshot(selectedcam);
imshow(handles.bgimage, 'Parent', handles.axes1);
clear selectedcam;
guidata(hObject,handles);

% --- Executes on button press in clear_axis_btn.
function clear_axis_btn_Callback(hObject, eventdata, handles)
% hObject    handle to clear_axis_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla;
