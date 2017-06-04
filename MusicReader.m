function varargout = MusicReader(varargin)
% MUSICREADER MATLAB code for MusicReader.fig
%      MUSICREADER, by itself, creates a new MUSICREADER or raises the existing
%      singleton*.
%
%      H = MUSICREADER returns the handle to a new MUSICREADER or the handle to
%      the existing singleton*.
%
%      MUSICREADER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MUSICREADER.M with the given input arguments.
%
%      MUSICREADER('Property','Value',...) creates a new MUSICREADER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MusicReader_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MusicReader_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MusicReader

% Last Modified by GUIDE v2.5 04-Jun-2017 13:15:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MusicReader_OpeningFcn, ...
                   'gui_OutputFcn',  @MusicReader_OutputFcn, ...
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


% --- Executes just before MusicReader is made visible.
function MusicReader_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MusicReader (see VARARGIN)

% Choose default command line output for MusicReader
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MusicReader wait for user response (see UIRESUME)
% uiwait(handles.figure1);


axes(handles.axes2);
imshow('logo.jpg');

% --- Outputs from this function are returned to the command line.
function varargout = MusicReader_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in choose.
function choose_Callback(hObject, eventdata, handles)
% hObject    handle to choose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


[file,path]=uigetfile('.jpg','Open File');

if file == 0
 return;
else
 dat_file = strcat(path,file);
img = importdata(dat_file, 't', 1);

axes(handles.axes1);
imshow(img);



% HORIZONTAL SPLIT
img_s = horizontal_split(img);

sheet = [];
% STAFF DETECTION
staff = staff_detection(img_s);

% SPLIT COMPASSES
for i = 1:length(staff)
    compass = vertical_split(staff{i});
    
    for j = 1:length(compass)
        
        notes = object_detection(compass{j});
        
        for k = 1:length(notes)
                
            note = notes{k};
            data = note_id(note);
            sheet = [sheet data '; '];
        end
    end
end

% imshow(handles.sheet_image,dat_file);
% sheet_read = sheet_reader(sheet);

% set(handles.staff, 'String', sheet);
handles.sheet = sheet;
guidata(hObject, handles)

end




% --- Executes on button press in play.
function play_Callback(hObject, eventdata, handles)
% hObject    handle to play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

sheet_read = sheet_reader(handles.sheet);
sheet_translated = translator(sheet_read);
y = playing(sheet_translated); 
% y = playing(sheet_translated);
y = cell2mat(y);
handles.y = y;
guidata(hObject, handles);

% --- Executes on button press in save.
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

filename = 'output.wav';
audiowrite(filename,handles.y,44100);


% --- Executes on button press in help.
function help_Callback(hObject, eventdata, handles)
% hObject    handle to help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Help();


% --- Executes on button press in Sheet.
function Sheet_Callback(hObject, eventdata, handles)
% hObject    handle to Sheet (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sheet = handles.sheet;
save variable sheet

Sheet();
