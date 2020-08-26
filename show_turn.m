function y = show_turn(turn, handles)
if (turn == 2)
    set(handles.who , 'CData' , imread('images/261.png')) ;
else
    set(handles.who , 'CData' , imread('images/162.png')) ;
end
end