function varargout = NIRS_REST_ALFF(varargin)
% NIRS_REST_ALFF MATLAB code for NIRS_REST_ALFF.fig
%      NIRS_REST_ALFF, by itself, creates a new NIRS_REST_ALFF or raises the existing
%      singleton*.
%
%      H = NIRS_REST_ALFF returns the handle to a new NIRS_REST_ALFF or the handle to
%      the existing singleton*.
%
%      NIRS_REST_ALFF('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NIRS_REST_ALFF.M with the given input arguments.
%
%      NIRS_REST_ALFF('Property','Value',...) creates a new NIRS_REST_ALFF or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before NIRS_REST_ALFF_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to NIRS_REST_ALFF_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help NIRS_REST_ALFF

% Last Modified by GUIDE v2.5 04-Nov-2019 20:18:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @NIRS_REST_ALFF_OpeningFcn, ...
                   'gui_OutputFcn',  @NIRS_REST_ALFF_OutputFcn, ...
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


% --- Executes just before NIRS_REST_ALFF is made visible.
function NIRS_REST_ALFF_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to NIRS_REST_ALFF (see VARARGIN)

% Choose default command line output for NIRS_REST_ALFF
handles.output = hObject;
% Update handles structure

guidata(hObject, handles);
set(handles.isAlff_m,'enable','off');
set(handles.isAlff_z,'enable','off');
set(handles.isfAlff_m,'enable','off');
set(handles.isfAlff_z,'enable','off');

set(handles.Oxy,'value',1);
set(handles.Dxy,'value',1);

set(handles.bandlow,'string','0.01');
set(handles.bandhigh,'string','0.08');

set(handles.outpath,'string',pwd);

% UIWAIT makes NIRS_REST_ALFF wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = NIRS_REST_ALFF_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in run.
function run_Callback(hObject, eventdata, handles)
% hObject    handle to run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

N_Alff(handles);



function outpath_Callback(hObject, eventdata, handles)
% hObject    handle to outpath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of outpath as text
%        str2double(get(hObject,'String')) returns contents of outpath as a double


% --- Executes during object creation, after setting all properties.
function outpath_CreateFcn(hObject, eventdata, handles)
% hObject    handle to outpath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in output.
function output_Callback(hObject, eventdata, handles)
% hObject    handle to output (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
outpath = uigetdir;
if ischar(outpath)
    set(handles.outpath,'string',outpath);  % set outpath name
end


% --- Executes on selection change in inpathList.
function inpathList_Callback(hObject, eventdata, handles)
% hObject    handle to inpathList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns inpathList contents as cell array
%        contents{get(hObject,'Value')} returns selected item from inpathList
inpathList = get(handles.inpathList,'string');
k = get(handles.inpathList,'value');
files = dir(fullfile(inpathList{k},'*.mat'));
fileList = {};
if ~isempty(files)
    fileList{1} = files(1).name;
    for i = 2:length(files)
        fileList{i} = files(i).name;
    end
end
set(handles.fileList,'string',fileList);


% --- Executes during object creation, after setting all properties.
function inpathList_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inpathList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in addPath.
function addPath_Callback(hObject, eventdata, handles)
% hObject    handle to addPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
inpath = uigetdir(pwd);
if ischar(inpath)
    set(handles.inpathList,'string',inpath);
    
    sublist=dir(fullfile(inpath,'*.mat'));
    for n=1:length(sublist)
        subname{n}=sublist(n).name(1:end-4);
    end
    set(handles.fileList,'string',subname);   
end



function fileList_Callback(hObject, eventdata, handles)
% hObject    handle to fileList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fileList as text
%        str2double(get(hObject,'String')) returns contents of fileList as a double


% --- Executes during object creation, after setting all properties.
function fileList_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fileList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in isAlff_m.
function isAlff_m_Callback(hObject, eventdata, handles)
% hObject    handle to isAlff_m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of isAlff_m


% --- Executes on button press in isAlff_z.
function isAlff_z_Callback(hObject, eventdata, handles)
% hObject    handle to isAlff_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of isAlff_z


% --- Executes on button press in isfAlff_m.
function isfAlff_m_Callback(hObject, eventdata, handles)
% hObject    handle to isfAlff_m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of isfAlff_m


% --- Executes on button press in isfAlff_z.
function isfAlff_z_Callback(hObject, eventdata, handles)
% hObject    handle to isfAlff_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of isfAlff_z



function bandlow_Callback(hObject, eventdata, handles)
% hObject    handle to bandlow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bandlow as text
%        str2double(get(hObject,'String')) returns contents of bandlow as a double


% --- Executes during object creation, after setting all properties.
function bandlow_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bandlow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bandhigh_Callback(hObject, eventdata, handles)
% hObject    handle to bandhigh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bandhigh as text
%        str2double(get(hObject,'String')) returns contents of bandhigh as a double


% --- Executes during object creation, after setting all properties.
function bandhigh_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bandhigh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in onesampletest.
function onesampletest_Callback(hObject, eventdata, handles)
% hObject    handle to onesampletest (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
NIRS_stat_ttest;

% --- Executes on button press in twosampletest.
function twosampletest_Callback(hObject, eventdata, handles)
% hObject    handle to twosampletest (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
NIRS_stat_ttest2;

% --- Executes on button press in pairedtest.
function pairedtest_Callback(hObject, eventdata, handles)
% hObject    handle to pairedtest (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
NIRS_stat_ttest2paired;

% --- Executes on button press in correlationanalysis.
function correlationanalysis_Callback(hObject, eventdata, handles)
% hObject    handle to correlationanalysis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
NIRS_stat_correlation;

% --- Executes on button press in anova.
function anova_Callback(hObject, eventdata, handles)
% hObject    handle to anova (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
NIRS_stat_anova;


% --- Executes on button press in Oxy.
function Oxy_Callback(hObject, eventdata, handles)
% hObject    handle to Oxy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Oxy


% --- Executes on button press in Dxy.
function Dxy_Callback(hObject, eventdata, handles)
% hObject    handle to Dxy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Dxy


% --- Executes on button press in Total.
function Total_Callback(hObject, eventdata, handles)
% hObject    handle to Total (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Total


% --- Executes on button press in average.
function average_Callback(hObject, eventdata, handles)
% hObject    handle to average (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
NIRS_stat_average;


% --- Executes on button press in alff.
function alff_Callback(hObject, eventdata, handles)
% hObject    handle to alff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of alff
if get(handles.alff,'value') == 1
    set(handles.isAlff_m,'enable','on');
    set(handles.isAlff_z,'enable','on');
else
    set(handles.isAlff_m,'value',0);
    set(handles.isAlff_z,'value',0);
    set(handles.isAlff_m,'enable','off');
    set(handles.isAlff_z,'enable','off');
end


% --- Executes on button press in falff.
function falff_Callback(hObject, eventdata, handles)
% hObject    handle to falff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of falff

if get(handles.falff,'value') == 1
    set(handles.isfAlff_m,'enable','on');
    set(handles.isfAlff_z,'enable','on');
else
    set(handles.isfAlff_m,'value',0);
    set(handles.isfAlff_z,'value',0);
    set(handles.isfAlff_m,'enable','off');
    set(handles.isfAlff_z,'enable','off');
end
