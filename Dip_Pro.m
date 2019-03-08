function varargout = Dip_Pro(varargin)
% DIP_PRO MATLAB code for Dip_Pro.fig
%      DIP_PRO, by itself, creates a new DIP_PRO or raises the existing
%      singleton*.
%
%      H = DIP_PRO returns the handle to a new DIP_PRO or the handle to
%      the existing singleton*.
%
%      DIP_PRO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DIP_PRO.M with the given input arguments.
%
%      DIP_PRO('Property','Value',...) creates a new DIP_PRO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Dip_Pro_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Dip_Pro_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Dip_Pro

% Last Modified by GUIDE v2.5 27-Jan-2019 17:33:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Dip_Pro_OpeningFcn, ...
                   'gui_OutputFcn',  @Dip_Pro_OutputFcn, ...
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


% --- Executes just before Dip_Pro is made visible.
function Dip_Pro_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Dip_Pro (see VARARGIN)

% Choose default command line output for Dip_Pro
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Dip_Pro wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Dip_Pro_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

   [filename pathname] = uigetfile({'*.jpg;*.png'},'File Selector');
   handles.myImage = strcat(pathname, filename);
   axes(handles.axes1);
   imshow(handles.myImage)
   guidata(hObject,handles);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

  word = get(handles.edit1,'String'); 
  axes(handles.axes2);
  image1 = imread(handles.myImage);
  ocrResults = ocr(image1);
  bboxes = locateText(ocrResults, word, 'IgnoreCase', true);
  Highlighted_Text = insertShape(image1, 'FilledRectangle', bboxes);
  imshow(Highlighted_Text);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

  axes(handles.axes2);
  image2 = imread(handles.myImage);
  imshow(image2);
  cropped = imcrop(image2);
  imshow(cropped);

  guidata(hObject,handles);

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
% function edit1_CreateFcn(hObject, eventdata, handles)
% % hObject    handle to edit1 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
% 
% % Hint: edit controls usually have a white background on Windows.
% %       See ISPC and COMPUTER.
% if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%     set(hObject,'BackgroundColor','white');
% end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

  axes(handles.axes2);
  face = imread(handles.myImage);
  faceDetector = vision.CascadeObjectDetector;
  shapeInserter = vision.ShapeInserter('BorderColor','Custom','CustomBorderColor',[0 255 255]);
  bboxes = step(faceDetector, face);

  xMin = ceil(bboxes(1))
  xMax = xMin + bboxes(3) - 1
  yMin = ceil(bboxes(2))
  yMax = yMin + bboxes(4) - 1


  Cropped_Image = imcrop(face,[xMin-20 yMin-20 xMax-xMin+41 yMax-yMin+41]);
  %resize = imresize(I2,[100 100]);
  %imshow(resize);
  imshow(Cropped_Image);

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

  face = getimage(handles.axes2);
  [F,P] = uiputfile();
  imwrite(face,fullfile(P,F));


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
  axes(handles.axes2);
  Image   = imread(handles.myImage);
  ocrResults     = ocr(Image)
  recognizedText = ocrResults.Text;    
  imshow(Image);
  text(0,250,recognizedText, 'BackgroundColor', [1 1 1]);

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

  Image   = imread(handles.myImage);
  ocrResults     = ocr(Image)
  recognizedText = ocrResults.Text; 
  [F,P] = uiputfile();
  fid = fopen(fullfile(P,F),'w+');
  fprintf(fid, '%s\n', recognizedText);
  fclose(fid)
