function [possible] = recheck_moves(x,y,p,turn,possible)

ldat = p(x,y) ; 

for i = 1:8
    for j = 1:8
        if (possible(i,j) == 1)
            temp = p(i,j) ; 
            p(i,j) = 100*Col(ldat) + 10*Piece(ldat) + BG(temp) ;
            if (BG(ldat) == 1) p(x,y) = 101 ; 
            else p(x,y) = 202 ; 
            end
            
            if (InCheck(p,turn))
                possible(i,j) = 0 ;
            end
            p(x,y) = ldat ; 
            p(i,j) = temp ; 
        end
    end
end