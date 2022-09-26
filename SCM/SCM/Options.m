function varargout = Options(varargin)
% Options M-file for Options.fig
%      Options, by itself, creates a new Options or raises the existing
%      singleton*.
%
%      H = Options returns the handle to a new Options or the handle to
%      the existing singleton*.
%
%      Options('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in Options.M with the given input arguments.
%
%      Options('Property','Value',...) creates a new Options or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Options_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Options_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2003 The MathWorks, Inc.

% Edit the above text to modify the response to help Options

% Last Modified by GUIDE v2.5 25-Jul-2008 11:06:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Options_OpeningFcn, ...
                   'gui_OutputFcn',  @Options_OutputFcn, ...
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



% --- Executes just before Options is made visible.
function Options_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Options (see VARARGIN)

% Choose default command line output for Options
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Options wait for user response (see UIRESUME)
% uiwait(handles.figure1);
movegui('center')

% --- Outputs from this function are returned to the command line.
function varargout = Options_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton3.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

choice2=get(handles.radiobutton16, 'Value');%polarization parameter
choice3=get(handles.radiobutton12, 'Value');%environment parameter

if choice3==1
    env=1;
elseif choice3==0
    choice3=get(handles.radiobutton13, 'Value');
    if choice3==1
        env=2;
    elseif choice3==0
        env=3;
    end
end


if  choice2==0 
    data{1}=1;
    data{2}=0;%los=1 or nlos=0
    data{3}=get(handles.checkbox3,'Value');%enable plotting=1 dont enable=0;
    data{4}=env;%environment parameter
    closereq;
    if env==1
        submacro(data);
    elseif env==2
        urbmacro(data);
    elseif env==3
        urbmicro(data);
    end;
elseif choice2==1 
    data{1}=1;
    data{2}=0;%los=1 or nlos=0
    data{3}=get(handles.checkbox3,'Value');%enable plotting=1 dont enable=0;
    data{4}=env;%environment parameter
    closereq;
    if env==1
        pol_submacro(data);
    elseif env==2
        pol_urbmacro(data);
    elseif env==3
        pol_urbmicro(data);
    end;
end


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3




% --------------------------------------------------------------------
function uipanel9_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uipanel9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

helpdlg('Choose which Environment to simulate. For more information go to the manual p.8, 14','Environment Option')



% --------------------------------------------------------------------
function uipanel10_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uipanel10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

helpdlg('Choose which polarization case to simulate. For more information go to the manual p. 9-12,15','Polarization Option')



% --------------------------------------------------------------------
function uipanel6_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uipanel6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


helpdlg('Handle the Initial Options. For more information go to the manual p. 14-15','Initial Options')
