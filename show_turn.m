function y = show_turn(turn, handles)
if (turn == 2)
    set(handles.who , 'CData' , imread('261.png')) ;
else
    set(handles.who , 'CData' , imread('162.png')) ;
end
end