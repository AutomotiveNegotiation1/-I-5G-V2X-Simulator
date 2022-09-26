function varargout = urbmicro(varargin)
% URBMICRO M-file for urbmicro.fig
%      URBMICRO, by itself, creates a new URBMICRO or raises the existing
%      singleton*.
%
%      H = URBMICRO returns the handle to a new URBMICRO or the handle to
%      the existing singleton*.
%
%      URBMICRO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in URBMICRO.M with the given input arguments.
%
%      URBMICRO('Property','Value',...) creates a new URBMICRO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before urbmicro_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to urbmicro_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2003 The MathWorks, Inc.

% Edit the above txtS to modify the response to help urbmicro

% Last Modified by GUIDE v2.5 24-Jul-2008 20:06:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @urbmicro_OpeningFcn, ...
                   'gui_OutputFcn',  @urbmicro_OutputFcn, ...
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


% --- Executes just before urbmicro is made visible.
function urbmicro_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to urbmicro (see VARARGIN)

% Choose default command line output for urbmicro
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes urbmicro wait for user response (see UIRESUME)
% uiwait(handles.figure1);

data=varargin{1};
data=cell2mat(data);
handles.fixed=data(1);
handles.los=data(2);
handles.plotit=data(3);
guidata(hObject,handles);
if data(3)==0
    set(handles.txtpath,'Enable','off');
    set(handles.txtmonBS,'Enable','off');
    set(handles.txtmonMS,'Enable','off');
elseif data(3)==1
    set(handles.txtpath,'Enable','on');
    set(handles.txtmonBS,'Enable','on');
    set(handles.txtmonMS,'Enable','on');
end
% --- Outputs from this function are returned to the command line.
function varargout = urbmicro_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in radiobutton7.
function radiobutton7_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton7


% --- Executes on button press in radiobutton8.
function radiobutton8_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton8


% --- Executes on button press in radiobutton9.
function radiobutton9_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton9


% --- Executes on button press in radiobutton8.
function radiobutton10_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton8


% --- Executes on button press in radiobutton7.
function radiobutto7_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton7


% --- Executes on button press in radiobutton12.
function radiobutton12_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton12


function txtS_Callback(hObject, eventdata, handles)
% hObject    handle to txtS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtS as txtS
%        str2double(get(hObject,'String')) returns contents of txtS as a
%        double

% --- Executes during object creation, after setting all properties.
function txtS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtdBS_Callback(hObject, eventdata, handles)
% hObject    handle to txtdBS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtdBS as txtS
%        str2double(get(hObject,'String')) returns contents of txtdBS as a double


% --- Executes during object creation, after setting all properties.
function txtdBS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtdBS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtdMS_Callback(hObject, eventdata, handles)
% hObject    handle to txtdMS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtdMS as txtS
%        str2double(get(hObject,'String')) returns contents of txtdMS as a double


% --- Executes during object creation, after setting all properties.
function txtdMS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtdMS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtN_Callback(hObject, eventdata, handles)
% hObject    handle to txtN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtN as txtS
%        str2double(get(hObject,'String')) returns contents of txtN as a double


% --- Executes during object creation, after setting all properties.
function txtN_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtM_Callback(hObject, eventdata, handles)
% hObject    handle to txtM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtM as txtS
%        str2double(get(hObject,'String')) returns contents of txtM as a double


% --- Executes during object creation, after setting all properties.
function txtM_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtfc_Callback(hObject, eventdata, handles)
% hObject    handle to txtfc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtfc as txtS
%        str2double(get(hObject,'String')) returns contents of txtfc as a double


% --- Executes during object creation, after setting all properties.
function txtfc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtfc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtv_Callback(hObject, eventdata, handles)
% hObject    handle to txtv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtv as txtS
%        str2double(get(hObject,'String')) returns contents of txtv as a double


% --- Executes during object creation, after setting all properties.
function txtv_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtrDS_Callback(hObject, eventdata, handles)
% hObject    handle to txtrDS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtrDS as txtS
%        str2double(get(hObject,'String')) returns contents of txtrDS as a double


% --- Executes during object creation, after setting all properties.
function txtrDS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtrDS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtU_Callback(hObject, eventdata, handles)
% hObject    handle to txtU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtU as txtS
%        str2double(get(hObject,'String')) returns contents of txtU as a double


% --- Executes during object creation, after setting all properties.
function txtU_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtrAS_Callback(hObject, eventdata, handles)
% hObject    handle to txtrAS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtrAS as txtS
%        str2double(get(hObject,'String')) returns contents of txtrAS as a double


% --- Executes during object creation, after setting all properties.
function txtrAS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtrAS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtt_Callback(hObject, eventdata, handles)
% hObject    handle to txtt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtt as txtS
%        str2double(get(hObject,'String')) returns contents of txtt as a double


% --- Executes during object creation, after setting all properties.
function txtt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtX_Callback(hObject, eventdata, handles)
% hObject    handle to txtX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtX as txtS
%        str2double(get(hObject,'String')) returns contents of txtX as a double


% --- Executes during object creation, after setting all properties.
function txtX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function bsantenna_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bsantenna (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --------------------------------------------------------------------
function bsantenna_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to bsantenna (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


A=get(handles.radiobutton20, 'Value');
if A==1
    BSAP=1;%dipoles
else 
    BSAP=2;%cross dipoles
end

B=get(handles.radiobutton27, 'Value');
if B==1
    MSAP=1;%tilted dipoles
else
    MSAP=2;%cross dipoles
end

valR=str2double(get(handles.txtR,'string'));
if isnan(valR) | valR<=0 | mod(valR,floor(valR))~=0
    errordlg('Wrong Input for parameter R, R must be non zero natural','Error')
    return
end

b=get(handles.radiobutton12, 'Value');
if b==1
    [vald valthetaBS valthetaMS valomegaBS valomegaMS valthetav]=OrientationsFixBS(valR);
else
    vald=str2double(get(handles.resd,'string'));
    if isnan(vald) | vald<=0 | vald>valR
        errordlg('Wrong Input for parameter d, d must be a non zero natural smaller or equal to R','Error')
        return
    end
    valomegaMS=str2double(get(handles.resomegaMS,'string'));
    if isnan(valomegaMS) | valomegaMS<0 | valomegaMS>360
        errordlg('Wrong Input for parameter Omega MS, Omega MS must be positive real smaller than 360','Error')
        return
    end
    valthetaBS=str2double(get(handles.resthetaBS,'string'));
    if isnan(valthetaBS) | valthetaBS<0 | valthetaBS>360
        errordlg('Wrong Input for parameter Theta BS, Theta BS must be positive real smaller than 360','Error')
        return
    end
    valomegaBS=str2double(get(handles.resomegaBS,'string'));
    if isnan(valomegaBS) | valomegaBS<0 | valomegaBS>360
        errordlg('Wrong Input for parameter Omega BS, Omega BS must be positive real smaller than 360','Error')
        return
    end
    valthetav=str2double(get(handles.resthetav,'string'));
    if isnan(valthetav) | valthetav<0 | valthetav>360
        errordlg('Wrong Input for parameter Theta v, Theta v must be positive real smaller than 360','Error')
        return
    end
    valthetaMS=round(abs(valomegaBS-valomegaMS+valthetaBS+180));
end

valaBS=str2double(get(handles.edit42,'string'));
if valaBS<0 | valaBS>90
    errordlg('Wrong Input for parameter aBS, aBS must be greater or equal to zero and smaller or equal to 90','Error')
    return
end

valbMS=str2double(get(handles.edit45,'string'));
if valbMS<0 | valbMS>90
    errordlg('Wrong Input for parameter aBS, aBS must be greater or equal to zero and smaller or equal to 90','Error')
    return
end

valXPDdB=str2double(get(handles.txtXPD,'string'));
if isnan(valXPDdB) | valXPDdB<0 
    errordlg('Wrong Input for parameter XPD, XPD must be a positive real','Error')
    return
end
XPD=10^(valXPDdB/10);
valrn=1/XPD;

valS=str2double(get(handles.txtS,'string'));
if isnan(valS) | valS<=0 | mod(valS,floor(valS))~=0 
    errordlg('Wrong Input for parameter S, S must be non zero natural','Error')
    return
end

valU=str2double(get(handles.txtU,'string'));
if isnan(valU) | valU<=0 | mod(valU,floor(valU))~=0
    errordlg('Wrong Input for parameter U, U must be non zero natural','Error')
    return
end

valdBS=eval(get(handles.txtdBS,'string'));
if length(valdBS)~=(valS-1) & valS~=1
    errordlg('Check the Input distances at the Base Station','Error')
    return
elseif valS==1
    valdBS=0;
end

valdMS=eval(get(handles.txtdMS,'string'));
if length(valdMS)~=(valU-1) & valU~=1
    errordlg('Check the Input distances at the Mobile Station','Error')
    return
elseif valU==1
    valdMS=0;
end

valN=str2double(get(handles.txtN,'string'));
if isnan(valN) | valN<=0 | mod(valN,floor(valN))~=0
    errordlg('Wrong Input for parameter N, N must be non zero natural','Error')
    return
elseif valN>18
    errordlg('Input for parameter N too big, N must be smaller than 18','Error')
    return
end

valM=str2double(get(handles.txtM,'string'));
if isnan(valM) | valM<=0 | mod(valM,floor(valM))~=0
    errordlg('Wrong Input for parameter M, M must be non zero natural','Error')
    return
end

valfc=str2double(get(handles.txtfc,'string'));
if isnan(valfc) | valfc<=0 
    errordlg('Wrong Input for parameter fc, fc must be non zero positive real','Error')
    return
end

valv=str2double(get(handles.txtv,'string'));
if isnan(valv) | valv<0 
    errordlg('Wrong Input for parameter v, v must be non zero positive real','Error')
    return
end

valrDS=str2double(get(handles.txtrDS,'string'));
if isnan(valrDS) | valrDS<=0 
    errordlg('Wrong Input for parameter rDS, rDS must be non zero positive real','Error')
    return
end

valrAS=str2double(get(handles.txtrAS,'string'));
if isnan(valrAS) | valrAS<=0 
    errordlg('Wrong Input for parameter rAS, rAS must be non zero positive real','Error')
    return
end

valBSAS=str2double(get(handles.txtBSAS,'string'));
if isnan(valBSAS) | valBSAS<=0 
    errordlg('Wrong Input for parameter BSAS, BSAS must be non zero positive real','Error')
    return
end

valMSAS=str2double(get(handles.txtMSAS,'string'));
if isnan(valMSAS) | valMSAS<=0 
    errordlg('Wrong Input for parameter MSAS, MSAS must be non zero positive real','Error')
    return
end

valt=str2double(get(handles.txtt,'string'));
if isnan(valt) | valt<=0 
    errordlg('Wrong Input for parameter t, t must be non zero positive real','Error')
    return
end

valX=str2double(get(handles.txtX,'string'));
if isnan(valX) | valX<=0
    errordlg('Wrong Input for parameter X, X must be non zero positive real','Error')
    return
end

valSNR=str2double(get(handles.txtSNR,'string'));

valmonBS=str2double(get(handles.txtmonBS,'string'));
if isnan(valmonBS) | valmonBS<=0 | mod(valmonBS,floor(valmonBS))~=0 |valmonBS > valS & get(handles.radiobutton20, 'Value')==1;
    errordlg('Wrong Input for the BS antenna to plot, it must be non zero natural smaller or equal to S','Error')
    return
elseif isnan(valmonBS) | valmonBS<=0 | mod(valmonBS,floor(valmonBS))~=0 | valmonBS > 2*valS & get(handles.radiobutton20, 'Value')==0;
    errordlg('Wrong Input for the BS antenna to plot, it must be non zero natural smaller or equal to 2S','Error')
    return
end

valmonMS=str2double(get(handles.txtmonMS,'string'));
if isnan(valmonMS) | valmonMS<=0 | mod(valmonMS,floor(valmonMS))~=0 | valmonMS > valU & get(handles.radiobutton27, 'Value')==1;
    errordlg('Wrong Input for the MS antenna to plot, it must be non zero natural smaller or equal to U','Error')
    return
elseif isnan(valmonMS) | valmonMS<=0 | mod(valmonMS,floor(valmonMS))~=0 | valmonMS > 2*valU & get(handles.radiobutton27, 'Value')==0
    errordlg('Wrong Input for the MS antenna to plot, it must be non zero natural smaller or equal to 2U','Error')
    return
end

valpath=str2double(get(handles.txtpath,'string'));
if isnan(valpath) | valpath<=0 | mod(valpath,floor(valpath))~=0 | valpath > valN
    errordlg('Wrong Input for the path to plot, it must be non zero natural smaller or equal to N','Error')
    return
end

valD=str2double(get(handles.txtD,'string'));
if isnan(valD) | valD<=0 | mod(valD,floor(valD))~=0 
    errordlg('Wrong Input for D, D must be non zero natural','Error')
    return
end

valdrop=str2double(get(handles.txtdrop,'string'));
if isnan(valdrop) | valdrop<=0 | mod(valdrop,floor(valdrop))~=0 | valdrop > valD
    errordlg('Wrong Input for drop to plot, it must be non zero natural smaller or equal to D','Error')
    return
end

cor=[1 str2double(get(handles.edit50,'string')) str2double(get(handles.edit51,'string')) str2double(get(handles.edit52,'string')) 0 str2double(get(handles.edit53,'string')) str2double(get(handles.edit54,'string')) str2double(get(handles.edit55,'string')) str2double(get(handles.edit56,'string')) str2double(get(handles.edit57,'string'))]; 
if isnan(cor(2)) | isnan(cor(3)) | isnan(cor(4)) | isnan(cor(6)) |isnan(cor(7)) |isnan(cor(8)) |isnan(cor(9)) |isnan(cor(10)) 
    errordlg('Check the Correlated Parameters','Error')
    return
end

ti=valt/(0.001*valX);
k=1;
for k=1:valD
    if b==1
    [vald valthetaBS valthetaMS valomegaBS valomegaMS valthetav]=OrientationsFixBS(valR);
    else
    end
    d=get(handles.checkbox14, 'Value');%flag for fixed powers and delays
    if d==1
        A=handles.A;
        B=handles.B;
        for i=1:valN
            pn(i)=10^(str2num(get(handles.A(i),'string'))/10);
            tn(i)=str2num(get(handles.B(i),'string'))*10^(-6);
            i=i+1;
        end
    else
        pn=zeros(length(valN));
        tn=zeros(length(valN));
    end
    [Hn Pn tn AoDn AoAn dBS dMS AoDm AoAm Fnm d thetaBS thetaMS OmegaBS OmegaMS thetav sigmaAS sigmaDS sigmaSF PLdB]=MultipathPol(2,d,valR,2,valS,valU,valdBS,valdMS,valv,valN,valM,valfc,BSAP,MSAP,valaBS,valbMS,valrn,valBSAS,valMSAS,0,0,valrDS,valrAS,valt,valX,vald,valthetaBS,valomegaBS,valthetav,valthetaMS,valomegaMS,pn,tn,cor);
    if BSAP==2
        valS=2*valS;
    else
    end
    if MSAP==2
        valU=2*valU;
    else
    end
    H{k}=Hn;
    P{k}=Pn';
    AoD{k}=AoDn';
    AoA{k}=AoAn';
    t{k}=tn'*(10^6);
    AS(k)=sigmaAS;
    DS(k)=sigmaDS*(10^6);
    SF(k)=sigmaSF;
    PL(k)=PLdB;
    C{k}=Capacity(valN,valSNR,Hn,ti,valS,valU);
    if BSAP==2
        valS=valS/2;
    else
    end
    if MSAP==2
        valU=valU/2;
    else
    end
    k=k+1;
end

%-------------------------Correlation--------------------------------------

tii=[1:1:ti]*(0.001*valX);
for k=1:length(tii)
    res(k)=H{valdrop}{valpath,1}{k,1}(valmonBS,valmonMS);
    cap(k)=C{valdrop}(k,1);
    k=k+1; 
end
%------------Correlation end-----------------------------------------------
   
str=get(handles.structure, 'String');
filename='\data{1}.mat';
strfile=[str filename];
i=1;
while exist(strfile)==2
    string=['{' num2str(i) '}'];
    filename=['\data' string];
    filename=[filename '.mat'];
    strfile=[str filename];
    i=i+1;
end
set(handles.structure, 'String', str);
save  ([str filename],'H', 't','P','AoD','AoA','AS','DS','SF','PL','C')
%------------Plots function data-------------------------------------------
plotit=handles.plotit;
if plotit==1
    data{1}=tii;
    data{2}=real(10*log10(res));
    data{3}=tn;
    data{4}=Pn;
    data{5}=ti;
    data{6}=real(xcorr(res,'coeff'));
    data{7}=thetav;
    data{8}=AoAn;
    data{9}=AoDn;
    data{10}=valR;
    data{11}=valN;
    data{12}=d;
    data{13}=BSAP;
    data{14}=valthetaBS;
    data{15}=valomegaBS;
    data{16}=cap;
    data{17}=valv*valfc*(0.001*valX);
    plots(data);
else
end
%-------------Plots data end-----------------------------------------------

set(handles.resd, 'String', d);
set(handles.resthetav, 'String', thetav);
set(handles.resthetaBS, 'String', thetaBS);
set(handles.resthetaMS, 'String', thetaMS);
set(handles.resomegaBS, 'String', OmegaBS);
set(handles.resomegaMS, 'String', OmegaMS);

% --------------------------------------------------------------------
%function File_Callback(hObject, eventdata, handles)
% hObject    handle to File (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function bsantenna_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to bsantenna (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function txtmonBS_Callback(hObject, eventdata, handles)
% hObject    handle to txtmonBS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtmonBS as txtS
%        str2double(get(hObject,'String')) returns contents of txtmonBS as a double


% --- Executes during object creation, after setting all properties.
function txtmonBS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtmonBS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtmonMS_Callback(hObject, eventdata, handles)
% hObject    handle to txtmonMS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtmonMS as txtS
%        str2double(get(hObject,'String')) returns contents of txtmonMS as a double


% --- Executes during object creation, after setting all properties.
function txtmonMS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtmonMS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes during object creation, after setting all properties.
function axes9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes9

%imshow(imread('background.jpg'));




function edit23_Callback(hObject, eventdata, handles)
% hObject    handle to txtS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtS as txtS
%        str2double(get(hObject,'String')) returns contents of txtS as a double


% --- Executes during object creation, after setting all properties.
function edit23_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit24_Callback(hObject, eventdata, handles)
% hObject    handle to txtdBS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtdBS as txtS
%        str2double(get(hObject,'String')) returns contents of txtdBS as a double


% --- Executes during object creation, after setting all properties.
function edit24_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtdBS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit25_Callback(hObject, eventdata, handles)
% hObject    handle to txtdMS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtdMS as txtS
%        str2double(get(hObject,'String')) returns contents of txtdMS as a double


% --- Executes during object creation, after setting all properties.
function edit25_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtdMS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit26_Callback(hObject, eventdata, handles)
% hObject    handle to txtN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtN as txtS
%        str2double(get(hObject,'String')) returns contents of txtN as a double


% --- Executes during object creation, after setting all properties.
function edit26_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit27_Callback(hObject, eventdata, handles)
% hObject    handle to txtM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtM as txtS
%        str2double(get(hObject,'String')) returns contents of txtM as a double


% --- Executes during object creation, after setting all properties.
function edit27_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit28_Callback(hObject, eventdata, handles)
% hObject    handle to txtfc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtfc as txtS
%        str2double(get(hObject,'String')) returns contents of txtfc as a double


% --- Executes during object creation, after setting all properties.
function edit28_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtfc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit29_Callback(hObject, eventdata, handles)
% hObject    handle to txtv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtv as txtS
%        str2double(get(hObject,'String')) returns contents of txtv as a double


% --- Executes during object creation, after setting all properties.
function edit29_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit30_Callback(hObject, eventdata, handles)
% hObject    handle to txtrDS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtrDS as txtS
%        str2double(get(hObject,'String')) returns contents of txtrDS as a double


% --- Executes during object creation, after setting all properties.
function edit30_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtrDS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit31_Callback(hObject, eventdata, handles)
% hObject    handle to txtU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtU as txtS
%        str2double(get(hObject,'String')) returns contents of txtU as a double


% --- Executes during object creation, after setting all properties.
function edit31_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit32_Callback(hObject, eventdata, handles)
% hObject    handle to txtrAS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtrAS as txtS
%        str2double(get(hObject,'String')) returns contents of txtrAS as a double


% --- Executes during object creation, after setting all properties.
function edit32_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtrAS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit33_Callback(hObject, eventdata, handles)
% hObject    handle to txtt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtt as txtS
%        str2double(get(hObject,'String')) returns contents of txtt as a double

function edit36_Callback(hObject, eventdata, handles)
% hObject    handle to txtt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtt as txtS
%        str2double(get(hObject,'String')) returns contents of txtt as a
%        double
function edit36_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

function edit35_Callback(hObject, eventdata, handles)
% hObject    handle to txtt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtt as txtS
%        str2double(get(hObject,'String')) returns contents of txtt as a
%        double
function edit35_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function edit33_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit34_Callback(hObject, eventdata, handles)
% hObject    handle to txtX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtX as txtS
%        str2double(get(hObject,'String')) returns contents of txtX as a double


% --- Executes during object creation, after setting all properties.
function edit34_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function valmonBS_Callback(hObject, eventdata, handles)
% hObject    handle to txtmonBS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtmonBS as txtS
%        str2double(get(hObject,'String')) returns contents of txtmonBS as a double


% --- Executes during object creation, after setting all properties.
function valmonBS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtmonBS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function valmonMS_Callback(hObject, eventdata, handles)
% hObject    handle to txtmonMS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtmonMS as txtS
%        str2double(get(hObject,'String')) returns contents of txtmonMS as a double


% --- Executes during object creation, after setting all properties.
function valmonMS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtmonMS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





function txtpath_Callback(hObject, eventdata, handles)
% hObject    handle to txtpath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtpath as text
%        str2double(get(hObject,'String')) returns contents of txtpath as a double


% --- Executes during object creation, after setting all properties.
function txtpath_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtpath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --------------------------------------------------------------------
function About_Callback(hObject, eventdata, handles)
% hObject    handle to About (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

msgbox('Developed by Ioannis A. Xirouchakis','About')


% --------------------------------------------------------------------
function Help_Callback(hObject, eventdata, handles)
% hObject    handle to Help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --------------------------------------------------------------------
function helo_Callback(hObject, eventdata, handles)
% hObject    handle to helo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --------------------------------------------------------------------
function Exit_Callback(hObject, eventdata, handles)
% hObject    handle to Exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

exit=questdlg('Are you sure you want to exit?','Exit?','Yes','No','No');
switch exit
    case 'Yes'
        delete(urbmicro);
    case 'No'
        return
end



% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit38_Callback(hObject, eventdata, handles)
% hObject    handle to edit38 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit38 as text
%        str2double(get(hObject,'String')) returns contents of edit38 as a double


% --- Executes during object creation, after setting all properties.
function edit38_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit38 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





function txtR_Callback(hObject, eventdata, handles)
% hObject    handle to txtR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtR as text
%        str2double(get(hObject,'String')) returns contents of txtR as a double


% --- Executes during object creation, after setting all properties.
function txtR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end




% --------------------------------------------------------------------
function uipanel14_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to uipanel14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

a=get(handles.radiobutton12, 'Value');

if a==0
    set(handles.resd, 'Style', 'edit','BackgroundColor','white');
    set(handles.resthetav, 'Style', 'edit','BackgroundColor','w');
    set(handles.resthetaBS, 'Style', 'edit','BackgroundColor','w');    
    set(handles.resomegaBS, 'Style', 'edit','BackgroundColor','w');
    set(handles.resomegaMS, 'Style', 'edit','BackgroundColor','w');
elseif a==1
    set(handles.resd, 'Style', 'text');
    set(handles.resthetav, 'Style', 'text');
    set(handles.resthetaBS, 'Style', 'text');   
    set(handles.resomegaBS, 'Style', 'text');
    set(handles.resomegaMS, 'Style', 'text');
    set(handles.resthetaMS, 'Style', 'text');
end
    

% --------------------------------------------------------------------
function uipanel12_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to uipanel12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if get(handles.radiobutton20, 'Value')==1
    set(handles.text150, 'String', 'BS antenna(s)  tilt with respect to the z-axis in degrees');
    set(handles.text100, 'String', 'Number of antennas at BS array');
else
    set(handles.text150, 'String', 'BS antenna(s)  cross dipoles pair tilt with respect to the z-axis in degrees');
    set(handles.text100, 'String', 'Number of antenna pairs at BS array');
end
% --- Executes during object creation, after setting all properties.
function resd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to resd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called





function edit40_Callback(hObject, eventdata, handles)
% hObject    handle to edit40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit40 as text
%        str2double(get(hObject,'String')) returns contents of edit40 as a double


% --- Executes during object creation, after setting all properties.
function edit40_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit41_Callback(hObject, eventdata, handles)
% hObject    handle to edit41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit41 as text
%        str2double(get(hObject,'String')) returns contents of edit41 as a double


% --- Executes during object creation, after setting all properties.
function edit41_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit42_Callback(hObject, eventdata, handles)
% hObject    handle to edit42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit42 as text
%        str2double(get(hObject,'String')) returns contents of edit42 as a double


% --- Executes during object creation, after setting all properties.
function edit42_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit43_Callback(hObject, eventdata, handles)
% hObject    handle to edit43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit43 as text
%        str2double(get(hObject,'String')) returns contents of edit43 as a double


% --- Executes during object creation, after setting all properties.
function edit43_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit44_Callback(hObject, eventdata, handles)
% hObject    handle to edit44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit44 as text
%        str2double(get(hObject,'String')) returns contents of edit44 as a double


% --- Executes during object creation, after setting all properties.
function edit44_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit45_Callback(hObject, eventdata, handles)
% hObject    handle to edit45 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit45 as text
%        str2double(get(hObject,'String')) returns contents of edit45 as a double


% --- Executes during object creation, after setting all properties.
function edit45_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit45 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit46_Callback(hObject, eventdata, handles)
% hObject    handle to edit46 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit46 as text
%        str2double(get(hObject,'String')) returns contents of edit46 as a double


% --- Executes during object creation, after setting all properties.
function edit46_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit46 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit47_Callback(hObject, eventdata, handles)
% hObject    handle to edit47 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit47 as text
%        str2double(get(hObject,'String')) returns contents of edit47 as a double


% --- Executes during object creation, after setting all properties.
function edit47_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit47 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtBSAS_Callback(hObject, eventdata, handles)
% hObject    handle to txtBSAS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtBSAS as text
%        str2double(get(hObject,'String')) returns contents of txtBSAS as a double


% --- Executes during object creation, after setting all properties.
function txtBSAS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtBSAS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit49_Callback(hObject, eventdata, handles)
% hObject    handle to edit49 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit49 as text
%        str2double(get(hObject,'String')) returns contents of edit49 as a double


% --- Executes during object creation, after setting all properties.
function edit49_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit49 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





function txtMSAS_Callback(hObject, eventdata, handles)
% hObject    handle to txtMSAS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtMSAS as text
%        str2double(get(hObject,'String')) returns contents of txtMSAS as a double


% --- Executes during object creation, after setting all properties.
function txtMSAS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtMSAS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on button press in checkbox14.
function checkbox14_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox14

d=get(handles.checkbox14, 'Value');
valN=str2double(get(handles.txtN,'string'));

if d==1
    set(handles.uipanel19, 'Visible', 'on');
    set(handles.uipanel20, 'Visible', 'on');
    for i=1:valN
        if i<=6
        A(i)=uicontrol('style','edit','string',-3*i,'background','w','units','normalized','position',[0.60 0.92-0.06*i 0.04 0.03]);
        B(i)=uicontrol('style','edit','string',10*i,'background','w','units','normalized','position',[0.80 0.92-0.06*i 0.04 0.03]);   
        elseif i>6 & i<=12
        A(i)=uicontrol('style','edit','string',-3*i,'background','w','units','normalized','position',[0.66 1.28-0.06*i 0.04 0.03]);
        B(i)=uicontrol('style','edit','string',10*i,'background','w','units','normalized','position',[0.86 1.28-0.06*i 0.04 0.03]);   
        elseif i>12
        A(i)=uicontrol('style','edit','string',-3*i,'background','w','units','normalized','position',[0.72 1.64-0.06*i 0.04 0.03]);
        B(i)=uicontrol('style','edit','string',10*i,'background','w','units','normalized','position',[0.92 1.64-0.06*i 0.04 0.03]);      
        end
        i=i+1;
    end
    handles.A=A;
    handles.B=B;
    guidata(hObject,handles);
elseif d==0
    set(handles.uipanel19, 'Visible', 'off');
    set(handles.uipanel20, 'Visible', 'off');
    for i=1:valN
    set(handles.A(i), 'Visible', 'off');
    set(handles.B(i), 'Visible', 'off');
    end
end




function edit50_Callback(hObject, eventdata, handles)
% hObject    handle to edit50 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit50 as text
%        str2double(get(hObject,'String')) returns contents of edit50 as a double


% --- Executes during object creation, after setting all properties.
function edit50_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit50 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit51_Callback(hObject, eventdata, handles)
% hObject    handle to edit51 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit51 as text
%        str2double(get(hObject,'String')) returns contents of edit51 as a double


% --- Executes during object creation, after setting all properties.
function edit51_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit51 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit52_Callback(hObject, eventdata, handles)
% hObject    handle to edit52 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit52 as text
%        str2double(get(hObject,'String')) returns contents of edit52 as a double


% --- Executes during object creation, after setting all properties.
function edit52_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit52 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit53_Callback(hObject, eventdata, handles)
% hObject    handle to edit53 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit53 as text
%        str2double(get(hObject,'String')) returns contents of edit53 as a double


% --- Executes during object creation, after setting all properties.
function edit53_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit53 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit54_Callback(hObject, eventdata, handles)
% hObject    handle to edit54 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit54 as text
%        str2double(get(hObject,'String')) returns contents of edit54 as a double


% --- Executes during object creation, after setting all properties.
function edit54_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit54 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit55_Callback(hObject, eventdata, handles)
% hObject    handle to edit55 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit55 as text
%        str2double(get(hObject,'String')) returns contents of edit55 as a double


% --- Executes during object creation, after setting all properties.
function edit55_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit55 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit56_Callback(hObject, eventdata, handles)
% hObject    handle to edit56 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit56 as text
%        str2double(get(hObject,'String')) returns contents of edit56 as a double


% --- Executes during object creation, after setting all properties.
function edit56_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit56 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit57_Callback(hObject, eventdata, handles)
% hObject    handle to edit57 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit57 as text
%        str2double(get(hObject,'String')) returns contents of edit57 as a double


% --- Executes during object creation, after setting all properties.
function edit57_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit57 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on button press in checkbox16.
function checkbox16_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox16

e=get(handles.checkbox16, 'Value');

if e==1
    set(handles.uipanel16, 'Visible', 'on');
    set(handles.uipanel23, 'Visible', 'on');
elseif e==0
    set(handles.uipanel16, 'Visible', 'off');
    set(handles.uipanel23, 'Visible', 'off');
end



function txtSNR_Callback(hObject, eventdata, handles)
% hObject    handle to txtSNR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtSNR as text
%        str2double(get(hObject,'String')) returns contents of txtSNR as a double


% --- Executes during object creation, after setting all properties.
function txtSNR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtSNR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





function txtXPD_Callback(hObject, eventdata, handles)
% hObject    handle to txtXPD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtXPD as text
%        str2double(get(hObject,'String')) returns contents of txtXPD as a double


% --- Executes during object creation, after setting all properties.
function txtXPD_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtXPD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit61_Callback(hObject, eventdata, handles)
% hObject    handle to edit42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit42 as text
%        str2double(get(hObject,'String')) returns contents of edit42 as a double


% --- Executes during object creation, after setting all properties.
function edit61_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit62_Callback(hObject, eventdata, handles)
% hObject    handle to edit45 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit45 as text
%        str2double(get(hObject,'String')) returns contents of edit45 as a double


% --- Executes during object creation, after setting all properties.
function edit62_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit45 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on button press in pushbutton1.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in checkbox16.
function checkbox17_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox16


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stri=get(handles.structure, 'String');
str=uigetdir(get(handles.structure, 'String'),'Select folder to save data');
set(handles.structure, 'String', str);
if get(handles.structure, 'String')=='0'
    set(handles.structure, 'String', stri);
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton1.
function pushbutton1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --- Executes during object creation, after setting all properties.
function structure_CreateFcn(hObject, eventdata, handles)
% hObject    handle to structure (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end







% --------------------------------------------------------------------
function uipanel12_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uipanel12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



helpdlg('Choose the type of Base Station Antenna to use with the simulation. You can choose between dipole arrays and co-located, cross polarized dipole pairs. For more information go to the manual p.19','Base Station Antenna')



% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over edit42.
function edit42_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to edit42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)





function edit63_Callback(hObject, eventdata, handles)
% hObject    handle to txtXPD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtXPD as text
%        str2double(get(hObject,'String')) returns contents of txtXPD as a double


% --- Executes during object creation, after setting all properties.
function edit63_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtXPD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes during object creation, after setting all properties.
function radiobutton27_CreateFcn(hObject, eventdata, handles)
% hObject    handle to radiobutton27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function radiobutton26_CreateFcn(hObject, eventdata, handles)
% hObject    handle to radiobutton26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function uipanel28_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in radiobutton27.
function radiobutton27_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton27




% --- Executes on button press in radiobutton22.
function radiobutton22_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton22


% --- Executes on button press in radiobutton24.
function radiobutton24_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton24


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over radiobutton24.
function radiobutton24_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to radiobutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press over radiobutton24 with no controls selected.
function radiobutton24_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to radiobutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function uipanel29_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to uipanel29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.radiobutton27, 'Value')==1
    set(handles.text153, 'String', 'MS antenna(s)  tilt with respect to the z-axis in degrees');
    set(handles.text79, 'String', 'Number of antennas at MS array');
else
    set(handles.text153, 'String', 'MS antenna(s)  cross dipoles pair tilt with respect to the z-axis in degrees');
    set(handles.text79, 'String', 'Number of antenna pairs at MS array');
end

% --------------------------------------------------------------------
function uipanel11_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uipanel11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

helpdlg('Manage the Primary Input Parameters. For more information go to the manual p.22-24, 28')


% --------------------------------------------------------------------
function uipanel13_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uipanel13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

helpdlg('Manage the Orientation Parameters. They can either be Randon or Custom. If they are set to Custom then they need to be input manualy. For more information go to the manual p.21, 25','Orientation Options')



% --------------------------------------------------------------------
function uipanel14_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uipanel14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

helpdlg('Choose whether the Orientation Parameters are Random or Custom. For more information go to the manual p.21','Orientations')




% --------------------------------------------------------------------
function uipanel21_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uipanel21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

helpdlg('Manage the Correlated Parameters Delay Spread, Angle Spread and Shadow Fading i.e their mutual correlations and their means and standard deviations. For more information go to the manual p.26-27','Correlated Parameters DS, AS, SF')



% --------------------------------------------------------------------
function uipanel24_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uipanel24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

helpdlg('Manage the Secondary Input Parameters. For more information go to the manual p.24-28')



% --------------------------------------------------------------------
function uipanel19_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uipanel19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

helpdlg('Manualy input each of the N path Power and Delay. This action will form the Power-Delay Profile. For more information go to the manual p.19-20','Assign Path Powers and Delays')



% --------------------------------------------------------------------
function uipanel20_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uipanel20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

helpdlg('Manualy input each of the N path Power and Delay. This action will form the Power-Delay Profile. For more information go to the manual p.19-20','Assign Path Powers and Delays')



% --------------------------------------------------------------------
function uipanel22_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uipanel22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

helpdlg('Choose which Drop,Path and Link between the SxU antennas to plot. For more information go to the manual p.22')



function txtD_Callback(hObject, eventdata, handles)
% hObject    handle to txtD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtD as text
%        str2double(get(hObject,'String')) returns contents of txtD as a double


% --- Executes during object creation, after setting all properties.
function txtD_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtdrop_Callback(hObject, eventdata, handles)
% hObject    handle to txtdrop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtdrop as text
%        str2double(get(hObject,'String')) returns contents of txtdrop as a double


% --- Executes during object creation, after setting all properties.
function txtdrop_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtdrop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --------------------------------------------------------------------
function uipanel29_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uipanel29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


helpdlg('Choose the type of Mobile Station Antenna to use with the simulation. You can choose between dipole arrays and co-located, cross polarized dipole pairs. For more information go to the manual p.19','Base Station Antenna')


% --------------------------------------------------------------------
function uipanel16_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uipanel16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

helpdlg('Manualy input each of the N path Power and Delay. This action will form the Power-Delay Profile. For more information go to the manual p.19-20','Assign Path Powers and Delays')

