function [possible] = recheck_moves(x,y,board_state,turn,possible)

ldat = board_state(x,y); 
for i = 1:8
    for j = 1:8
        if (possible(i,j) == 1)
            temp = board_state(i,j); 
            board_state(i,j) = 100*Col(ldat) + 10*Piece(ldat) + BG(temp);
            if (BG(ldat) == 1) board_state(x,y) = 101; 
            else board_state(x,y) = 202; 
            end
            
            if (InCheck(board_state,turn))
                possible(i,j) = 0;
            end
            
            board_state(x,y) = ldat; 
            board_state(i,j) = temp; 
        end
    end
end