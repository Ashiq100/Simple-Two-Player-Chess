function varargout = Run(varargin)
% RUN M-file for Run.fig
%      RUN, by itself, creates a new RUN or raises the existing
%      singleton*.
%
%      H = RUN returns the handle to a new RUN or the handle to
%      the existing singleton*.
%
%      RUN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RUN.M with the given input arguments.
%
%      RUN('Property','Value',...) creates a new RUN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Run_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Run_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Run

% Last Modified by GUIDE v2.5 26-Aug-2020 19:49:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Run_OpeningFcn, ...
                   'gui_OutputFcn',  @Run_OutputFcn, ...
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


% --- Executes just before Run is made visible.
function Run_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Run (see VARARGIN)

% Choose default command line output for Run
handles.output = hObject;



% actual code starts here ... 

global board_state; 
% stores the current board state
% an integer in each cell in form abc
% a = color of piece, 1 : white, 2 : black 
% b = which piece, 1: pawn, 2: bishop, 3: knight, 4: rook, 5: queen, 6: king 
% c = backgroud, 1 : white 2 : black 
board_state = [142 131 122 151 162 121 132 141;
     111 112 111 112 111 112 111 112;
     202 101 202 101 202 101 202 101; 
     101 202 101 202 101 202 101 202;
     202 101 202 101 202 101 202 101; 
     101 202 101 202 101 202 101 202;
     212 211 212 211 212 211 212 211;
     241 232 221 252 261 222 231 242];  

global turn; % who plays now. 1: white, 2: black
turn = 1;
global prev; % whether the current player has toggled a piece or not
prev = 0;
global show_move; % should show move or not 
show_move = 0;

% initialzed picture 
for i = 1:8
    for j = 1:8
        s = num2str(board_state(i,j)) ; 
        s = strcat(s,'.png') ; 
        bg = imread(s);
        set(handles.(sprintf('pb%d%d',i,j)) , 'CData' , bg) ; 
    end
end

% set white king on the who plays button
set(handles.who, 'CData' , imread('162.png'));

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Run wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = Run_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in exit.
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcbf)

% --- Executes on button press in concede.
function concede_Callback(hObject, eventdata, handles)
% hObject    handle to concede (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global turn; 
if (turn == 2)msgbox('White Wins') ; 
else msgbox('Black WIns') ; 
end

function pushbutton_callback(hObject, eventdata, handles)
global show_move; global prev; global board_state; global turn; 
global lx; global ly; global possible; 
cell = get(hObject, 'tag');
% cx, cy: current cell 
cx = round(str2double(cell(3)));
cy = round(str2double(cell(4)));

if (prev == 0)
    lx = cx; ly = cy;
    possible = generate(lx,ly,board_state,turn);
    possible = recheck_moves(lx,ly,board_state,turn,possible); 
    if(show_move) 
        show(handles,board_state,possible); 
    end
    cnt = sum(sum(possible));
    if (cnt >= 1)prev = 1;
    else msgbox('No Move');
    end
else
    disshow(handles,board_state,possible) ;
    if (lx == cx && ly == cy)
        possible = zeros(8);
    elseif (possible(cx,cy) == 0)
        msgbox('Invalid Move'); 
    else
        board_state = swap_pos(lx,ly,cx,cy,board_state,handles) ;
        turn = mod(turn,2) + 1 ;
        show_turn(turn,handles) ; 
        if (CheckMate(board_state, turn))
            if (turn == 2)
                msgbox('White Wins') ;
            else
                msgbox('Black Wins') ;
            end
        elseif (InCheck(board_state,turn))
            msgbox('King in Check')
        end
    end
    prev = 0;
end

% --- Executes on button press in ch.
function ch_Callback(hObject, eventdata, handles)
% hObject    handle to ch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ch
global show_move; 
show_move = get(handles.ch, 'Value') ; 
