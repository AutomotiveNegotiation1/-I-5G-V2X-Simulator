function varargout = plots(varargin)
% PLOTS M-file for plots.fig
%      PLOTS, by itself, creates a new PLOTS or raises the existing
%      singleton*.
%
%      H = PLOTS returns the handle to a new PLOTS or the handle to
%      the existing singleton*.
%
%      PLOTS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PLOTS.M with the given input arguments.
%
%      PLOTS('Property','Value',...) creates a new PLOTS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before plots_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to plots_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2003 The MathWorks, Inc.

% Edit the above text to modify the response to help plots

% Last Modified by GUIDE v2.5 29-Apr-2007 20:19:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @plots_OpeningFcn, ...
                   'gui_OutputFcn',  @plots_OutputFcn, ...
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


% --- Executes just before plots is made visible.
function plots_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to plots (see VARARGIN)

% Choose default command line output for plots
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes plots wait for user response (see UIRESUME)
% uiwait(handles.figure1);

data=varargin{1};
thetav=data{7};
AoAn=data{8};
AoDn=data{9};
R=data{10};
N=data{11};
d=data{12};
BSAP=data{13};
thetaBS=data{14};
omegaBS=data{15};


axes(handles.axes1)
plot(data{1},data{2})
xlabel('time in seconds')
ylabel('reception in dBs')
title('Channel Fast Fading')
grid on

axes(handles.axes2)
stem(data{3},data{4})
xlabel('delay in seconds')
ylabel('amplitude')
title('Power Delay Profile')
grid on

axes(handles.axes3)
x1=length(data{6});
x2=[-((x1-1)/2):1:((x1-1)/2)]*data{17};
plot(x2,data{6},'b*-.')
xlabel('distance in wavelengths')
ylabel('amplitude')
title('Spatial Autocorrelation')
xlim([-0.02 4])
grid on

axes(handles.axes7)
plot(data{1},real(data{16}),'b--.')
brob = robustfit(data{1},real(data{16}));
hold on
plot(data{1},brob(1)+brob(2)*data{1},'r-','LineWidth',2)
xlabel('time in seconds')
ylabel('Capacity in bps/Hz')
title('Channel Capacity')
grid on
hold off
%--------------Orientations------------------------------------------------

i=0;
for i=0:N-1
    A1(i+1)=d*(cosd(AoAn(i+1))+sqrt((cosd(AoAn(i+1)))^2-1+(1/(4*(cos(AoDn(i+1)))^2))));
    A2(i+1)=d*(cosd(AoAn(i+1)))-sqrt((cosd(AoAn(i+1)))^2-1+(1/(4*(cos(AoDn(i+1)))^2)));
    x21(i+1)=cosd(thetav+AoDn(i+1))*A1(i+1);
    y21(i+1)=sind(thetav+AoDn(i+1))*A1(i+1);
    i=i+1;
end
x=d*sind(omegaBS+thetaBS);
x1=[0,x];
y=d*cosd(omegaBS+thetaBS);
y1=[0,y];
axes(handles.axes5)
hold off
plot(x,y,'bo--','MarkerSize',10,'MarkerFaceColor','r'),grid off
xlim([-R,R])
ylim([-R,R])
text(x1,y1,'MS','FontSize',8)

xBS=[0.77 0.77+0.1*sind(omegaBS)];
yBS=[0.66 0.66+0.1*cosd(omegaBS)];
annotation('line',xBS,yBS);

i=0;
for i=0:N-1
    hold on
    xn21=[0,x21(i+1)];
    yn21=[0,y21(i+1)];
    plot(real(xn21),real(yn21),'ko--','MarkerSize',15),grid off
    xm21=[x1,x21(i+1)];
    ym21=[y1,y21(i+1)];
    plot(real(xm21),real(ym21),'k--'),grid on 
    i=i+1;
end
hold on 
plot(0,0,'bo--','MarkerSize',20,'MarkerFaceColor','r'),grid off
text(0,0,'BS')
hold on
xo=[0:1:R-1];
i=0;
for i=0:R-1
    yo1(i+1)=sqrt(abs(R^2-(xo(i+1))^2));
    yo2(i+1)=-sqrt(abs(R^2-(xo(i+1))^2));
    i=i+1;
end
xo1=[0:1:floor(R/2)];
xo2=[floor(R/2):1:floor((3*R)/2)];
xo3=[floor((3*R)/2+1):1:2*R];

i=0;
for i=0:floor(R/2) 
    zo1(i+1)=sqrt(3)*xo1(i+1);
    i=i+1;
end
i=0;
for i=0:R
    zo2(i+1)=sqrt(3)*R/2;
    i=i+1;
end

i=0;
for i=0:floor(R/2)-1
    zo3(i+1)=(sqrt(3)*R)/2-sqrt(3)*xo1(i+1);
    i=i+1;
end

plot(-xo,yo1,'--b'),grid off
hold on
plot(-xo,yo2,'--b'),grid off
hold on
plot(xo,yo2,'--b'),grid off
hold on
plot(xo,yo1,'--b'),grid off

hold on
plot(xo2-R,zo2,'r'),grid off
hold on
plot(xo2-R,-zo2,'r'),grid off
hold on
plot(xo1-R,zo1,'r'),grid off
hold on
plot(xo1-R,-zo1,'r'),grid off
hold on
plot(xo3-R,zo3,'r'),grid off
hold on
plot(xo3-R,-zo3,'r'),grid off

% --- Outputs from this function are returned to the command line.
function varargout = plots_OutputFcn(hObject, eventdata, handles) 
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
closereq;

