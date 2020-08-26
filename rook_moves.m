function [possible] = rook_moves(x,y,p,turn)
possible = zeros(8) ; 
if (turn == 1)
    for i = 1:8
        if (x+i>8)
            break ; 
        end
        if (IsWhite(p(x+i,y)))
            break ; 
        end
        if (NoPiece(p(x+i,y)))
            possible(x+i,y) = 1 ; 
        else
            possible(x+i,y) = 1 ;
            break ; 
        end
    end
    
    for i = 1:8
        if (y+i>8)
            break ; 
        end
        if (IsWhite(p(x,y+i)))
            break ; 
        end
        if (NoPiece(p(x,y+i)))
            possible(x,y+i) = 1 ; 
        else
            possible(x,y+i) = 1 ;
            break ; 
        end
    end
    
    for i = 1:8
        if (x-i<1)
            break ; 
        end
        if (IsWhite(p(x-i,y)))
            break ; 
        end
        if (NoPiece(p(x-i,y)))
            possible(x-i,y) = 1 ; 
        else
            possible(x-i,y) = 1 ;
            break ; 
        end
    end
    
    for i = 1:8
        if (y-i<1)
            break ; 
        end
        if (IsWhite(p(x,y-i)))
            break ; 
        end
        if (NoPiece(p(x,y-i)))
            possible(x,y-i) = 1 ; 
        else
            possible(x,y-i) = 1 ;
            break ; 
        end
    end
else
    for i = 1:8
        if (x+i>8)
            break ; 
        end
        if (IsBlack(p(x+i,y)))
            break ; 
        end
        if (NoPiece(p(x+i,y)))
            possible(x+i,y) = 1 ; 
        else
            possible(x+i,y) = 1 ;
            break ; 
        end
    end
    
    for i = 1:8
        if (y+i>8)
            break ; 
        end
        if (IsBlack(p(x,y+i)))
            break ; 
        end
        if (NoPiece(p(x,y+i)))
            possible(x,y+i) = 1 ; 
        else
            possible(x,y+i) = 1 ;
            break ; 
        end
    end
    
    for i = 1:8
        if (x-i<1)
            break ; 
        end
        if (IsBlack(p(x-i,y)))
            break ; 
        end
        if (NoPiece(p(x-i,y)))
            possible(x-i,y) = 1 ; 
        else
            possible(x-i,y) = 1 ;
            break ; 
        end
    end
    
    for i = 1:8
        if (y-i<1)
            break ; 
        end
        if (IsBlack(p(x,y-i)))
            break ; 
        end
        if (NoPiece(p(x,y-i)))
            possible(x,y-i) = 1 ; 
        else
            possible(x,y-i) = 1 ;
            break ; 
        end
    end
end