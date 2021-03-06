function varargout = NIRS_Rest_Analysis(varargin)
% NIRS_REST_ANALYSIS MATLAB code for NIRS_Rest_Analysis.fig
%      NIRS_REST_ANALYSIS, by itself, creates a new NIRS_REST_ANALYSIS or raises the existing
%      singleton*.
%
%      H = NIRS_REST_ANALYSIS returns the handle to a new NIRS_REST_ANALYSIS or the handle to
%      the existing singleton*.
%
%      NIRS_REST_ANALYSIS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NIRS_REST_ANALYSIS.M with the given input arguments.
%
%      NIRS_REST_ANALYSIS('Property','Value',...) creates a new NIRS_REST_ANALYSIS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before NIRS_Rest_Analysis_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to NIRS_Rest_Analysis_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help NIRS_Rest_Analysis

% Last Modified by GUIDE v2.5 02-Sep-2019 10:44:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @NIRS_Rest_Analysis_OpeningFcn, ...
                   'gui_OutputFcn',  @NIRS_Rest_Analysis_OutputFcn, ...
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


% --- Executes just before NIRS_Rest_Analysis is made visible.
function NIRS_Rest_Analysis_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to NIRS_Rest_Analysis (see VARARGIN)

% Choose default command line output for NIRS_Rest_Analysis
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes NIRS_Rest_Analysis wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = NIRS_Rest_Analysis_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in ALFF.
function ALFF_Callback(hObject, eventdata, handles)
% hObject    handle to ALFF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
NIRS_REST_ALFF;

% --- Executes on button press in ROI2ROI.
function ROI2ROI_Callback(hObject, eventdata, handles)
% hObject    handle to ROI2ROI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
NIRS_REST_ROI;

% --- Executes on button press in Network.
function Network_Callback(hObject, eventdata, handles)
% hObject    handle to Network (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
NIRS_Network_Analysis;

% --- Executes on button press in ROI2Whole.
function ROI2Whole_Callback(hObject, eventdata, handles)
% hObject    handle to ROI2Whole (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
NIRS_REST_Whole;

% --- Executes on button press in Matirx.
function Matirx_Callback(hObject, eventdata, handles)
% hObject    handle to Matirx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
NIRS_REST_Matrix;
