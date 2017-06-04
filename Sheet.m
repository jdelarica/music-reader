function varargout = Sheet(varargin)
% SHEET MATLAB code for Sheet.fig
%      SHEET, by itself, creates a new SHEET or raises the existing
%      singleton*.
%
%      H = SHEET returns the handle to a new SHEET or the handle to
%      the existing singleton*.
%
%      SHEET('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SHEET.M with the given input arguments.
%
%      SHEET('Property','Value',...) creates a new SHEET or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Sheet_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Sheet_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Sheet

% Last Modified by GUIDE v2.5 04-Jun-2017 13:14:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Sheet_OpeningFcn, ...
                   'gui_OutputFcn',  @Sheet_OutputFcn, ...
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


% --- Executes just before Sheet is made visible.
function Sheet_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Sheet (see VARARGIN)

% Choose default command line output for Sheet
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Sheet wait for user response (see UIRESUME)
% uiwait(handles.figure1);


axes(handles.axes1);
imshow('logo.jpg');

load variable
set(handles.chords, 'String', sheet);
sheet_read = sheet_reader(sheet);
sheet_translated = translator(sheet_read);
set(handles.chords_translated, 'String', sheet_translated);

% --- Outputs from this function are returned to the command line.
function varargout = Sheet_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function chords_Callback(hObject, eventdata, handles)
% hObject    handle to chords (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of chords as text
%        str2double(get(hObject,'String')) returns contents of chords as a double


% --- Executes during object creation, after setting all properties.
function chords_CreateFcn(hObject, eventdata, handles)
% hObject    handle to chords (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
