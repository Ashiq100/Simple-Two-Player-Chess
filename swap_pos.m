function [new_board_state] = swap_pos(lx,ly,cx,cy,board_state,handles) 
ldat = board_state(lx,ly); 
cdat = board_state(cx,cy);
lbg = BG(ldat); 
cbg = BG(cdat); 
pc = Piece(ldat); 

board_state(cx,cy) = 100*Col(ldat) + 10*Piece(ldat) + BG(cdat); 
s = num2str(board_state(cx,cy)); 
s = strcat(s,'.png'); 
bg = imread(s);
set(handles.(sprintf('pb%d%d',cx,cy)) , 'CData' , bg) ;
if (BG(ldat) == 1)
    board_state(lx,ly) = 101; 
else 
    board_state(lx,ly) = 202 ;
end
s = num2str(board_state(lx,ly)) ; 
s = strcat(s,'.png') ; 
bg = imread(s);
set(handles.(sprintf('pb%d%d',lx,ly)) , 'CData' , bg);
new_board_state = board_state;
end