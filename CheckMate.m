function fl = CheckMate(board_state,turn)
fl = 1; 
kx = 0; 
ky = 0; 
possible = zeros(8); 
ldat = 0; 
for x = 1:8
    for y = 1:8
        if (Col(board_state(x,y)) == turn && Piece(board_state(x,y)) > 0)
            possible = generate(x,y,board_state,turn) ; 
            for i = 1:8
                for j = 1:8
                    if (possible(i,j) == 1)
                        temp = board_state(i,j) ; 
                        ldat = board_state(x,y) ; 
                        board_state(i,j) = 100*Col(ldat) + 10*Piece(ldat) + BG(temp) ;
                        if (BG(ldat) == 1) board_state(x,y) = 101 ; 
                        else board_state(x,y) = 202 ; 
                        end
                        if (~InCheck(board_state,turn))
                            fl = 0 ; 
                            return ; 
                        end
                        board_state(i,j) = temp ; 
                        board_state(x,y) = ldat ; 
                    end
                end
            end   
        end
    end
end

end


