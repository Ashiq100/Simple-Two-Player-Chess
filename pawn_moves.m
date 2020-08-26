function [possible] = pawn_moves(x,y,p,turn)
possible = zeros(8) ; 
if (turn == 1)
    
    if (x+1 <= 8 && (p(x+1,y) == 202 || p(x+1,y) == 101) )
        
        possible(x+1,y) = 1 ;
        if (x == 2 && x+2 <= 8 && (p(x+2,y) == 202 || p(x+2,y) == 101))
            possible(x+2,y) = 1 ; 
        end
    end
    
    if (x+1 <= 8 && y+1 <= 8 && IsBlack(p(x+1,y+1)))
        possible(x+1,y+1) = 1 ;
    end
    
    if (x+1 <= 8 && y-1 >= 1 &&  IsBlack(p(x+1,y-1)))
        possible(x+1,y-1) = 1 ;
    end
else
    if ( x-1 >= 0 && ( p(x-1,y) == 101 || p(x-1,y) == 202 ) )
        possible(x-1,y) = 1 ;
        if (x == 7 && x-2 >= 0 && ( p(x-2,y) == 202 || p(x-2,y) == 101 ) )
            possible(x-2,y) = 1 ; 
        end
    end
    
    if (x-1 >= 0 && y+1 <= 8 && IsWhite(p(x-1,y+1)))
        possible(x-1,y+1) = 1 ;
    end
    
    if (x-1 >= 0 && y-1 >= 1 && IsWhite(p(x-1,y-1)))
        possible(x-1,y-1) = 1 ;
    end
    
end