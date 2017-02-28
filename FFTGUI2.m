function varargout = FFTGUI2(varargin)
% FFTGUI2 MATLAB code for FFTGUI2.fig
%      FFTGUI2, by itself, creates a new FFTGUI2 or raises the existing
%      singleton*.
%
%      H = FFTGUI2 returns the handle to a new FFTGUI2 or the handle to
%      the existing singleton*.
%
%      FFTGUI2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FFTGUI2.M with the given input arguments.
%
%      FFTGUI2('Property','Value',...) creates a new FFTGUI2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FFTGUI2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FFTGUI2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FFTGUI2

% Last Modified by GUIDE v2.5 26-Feb-2014 20:45:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FFTGUI2_OpeningFcn, ...
                   'gui_OutputFcn',  @FFTGUI2_OutputFcn, ...
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


% --- Executes just before FFTGUI2 is made visible.
function FFTGUI2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FFTGUI2 (see VARARGIN)
I=imread('fft8.jpg');
% line([10,10],[2,2])
% line([1,1],[20,2])
image(I)
axis off
axis tight
% Choose default command line output for FFTGUI2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FFTGUI2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FFTGUI2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
handles.x0=str2double(get(hObject,'String'));
handles.output = hObject;
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x=[handles.x0 handles.x1 handles.x2 handles.x3 handles.x4 handles.x5 handles.x6 handles.x7 ];
handles.output = hObject;
y0= x(1) + x(5);
y1= x(1) - x(5);

y2= x(3) + x(7);
y3= x(3) - x(7);

y4= x(2) + x(6);
y5= x(2) - x(6);

y6= x(4) + x(8);
y7= x(4) - x(8);
set(handles.y0,'String',num2str(y0))
set(handles.y1,'String',num2str(y1))
set(handles.y2,'String',num2str(y2))
set(handles.y3,'String',num2str(y3))

set(handles.y4,'String',num2str(y4))
set(handles.y5,'String',num2str(y5))
set(handles.y6,'String',num2str(y6))
set(handles.y7,'String',num2str(y7))

W=exp(-j*2*pi/8);

y3=(W^2)*y3;
y7=(W^2)*y7;
h0= y0 + y2;
h1= y1 + y3;

h2= y0 - y2;
h3= y1 - y3;

h4= y4 + y6;
h5= y5 + y7;

h6= y4 - y6;
h7= y5 - y7;

set(handles.h0,'String',num2str(h0))
set(handles.h1,'String',num2str(h1))
set(handles.h2,'String',num2str(h2))
set(handles.h3,'String',num2str(h3))
set(handles.h4,'String',num2str(h4))
set(handles.h5,'String',num2str(h5))
set(handles.h6,'String',num2str(h6))
set(handles.h7,'String',num2str(h7))

h5=W*h5;
h6=(W^2)*h6;
h7=(W^3)*h7;

X0 = h0 + h4;
X1 = h1 + h5;
X2 = h2 + h6;
X3 = h3 + h7;
X4 = h0 - h4;
X5 = h1 - h5;
X6 = h2 - h6;
X7 = h3 - h7;

set(handles.X0,'String',num2str(round(X0*1000)/1000))
set(handles.X1,'String',num2str(round(X1*1000)/1000))
set(handles.X2,'String',num2str(round(X2*1000)/1000))
set(handles.X3,'String',num2str(round(X3*1000)/1000))
set(handles.X4,'String',num2str(round(X4*1000)/1000))
set(handles.X5,'String',num2str(round(X5*1000)/1000))
set(handles.X6,'String',num2str(round(X6*1000)/1000))
set(handles.X7,'String',num2str(round(X7*1000)/1000))


x
fft(x)

% x=0:7
% X=fft(x);
% set(handles.X0,'String',num2str(X(1)))
% set(handles.X1,'String',num2str(X(2)))
% set(handles.X2,'String',num2str(X(3)))
% set(handles.X3,'String',num2str(X(4)))
% set(handles.X4,'String',num2str(X(5)))
% set(handles.X5,'String',num2str(X(6)))
% set(handles.X6,'String',num2str(X(7)))
% set(handles.X7,'String',num2str(X(8)))


% Update handles structure
guidata(hObject, handles);



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
handles.x4=str2double(get(hObject,'String'));
handles.output = hObject;
guidata(hObject, handles);


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
handles.x2=str2double(get(hObject,'String'));
handles.output = hObject;
guidata(hObject, handles);


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
handles.x6=str2double(get(hObject,'String'));
handles.output = hObject;
guidata(hObject, handles);


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



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double
handles.x1=str2double(get(hObject,'String'));
handles.output = hObject;
guidata(hObject, handles);

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



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double
handles.x5=str2double(get(hObject,'String'));
handles.output = hObject;
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double
handles.x3=str2double(get(hObject,'String'));
handles.output = hObject;
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double
handles.x7=str2double(get(hObject,'String'));
handles.output = hObject;
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
