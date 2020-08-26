function [possible] = bishop_moves(x,y,p,turn) 
possible  = zeros(8); 
if (turn == 1)

    for i = 1:8
        if (x+i>8 || y+i>8) 
            break ; 
        end
        if (IsWhite(p(x+i,y+i)))
            break ; 
        end
        if (p(x+i,y+i) == 101 || p(x+i,y+i) == 202)
            possible(x+i,y+i) = 1 ; 
        else
            possible(x+i,y+i) = 1 ; 
            break ; 
        end
    end
    
    for i = 1:8
        if (x-i<1 || y-i<1) 
            break ; 
        end
        if (IsWhite(p(x-i,y-i)))
            break ; 
        end
        if (p(x-i,y-i) == 101 || p(x-i,y-i) == 202)
            possible(x-i,y-i) = 1 ; 
        else
            possible(x-i,y-i) = 1 ; 
            break ; 
        end
    end
    
    for i = 1:8
        if (x+i>8 || y-i<1) 
            break ; 
        end
        if (IsWhite(p(x+i,y-i)))
            break ; 
        end
        if (p(x+i,y-i) == 101 || p(x+i,y-i) == 202)
            possible(x+i,y-i) = 1 ; 
        else
            possible(x+i,y-i) = 1 ; 
            break ; 
        end
    end
    for i = 1:8
        if (x-i<1 || y+i>8) 
            break ; 
        end
        if (IsWhite(p(x-i,y+i)))
            break ; 
        end
        if (p(x-i,y+i) == 101 || p(x-i,y+i) == 202)
            possible(x-i,y+i) = 1 ; 
        else
            possible(x-i,y+i) = 1 ; 
            break ; 
        end
    end
    
else
    
    for i = 1:8
        if (x+i>8 || y+i>8) 
            break ; 
        end
        if (IsBlack(p(x+i,y+i)))
            break ; 
        end
        if (p(x+i,y+i) == 101 || p(x+i,y+i) == 202)
            possible(x+i,y+i) = 1 ; 
        else
            possible(x+i,y+i) = 1 ; 
            break ; 
        end
    end
    
    for i = 1:8
        if (x-i<1 || y-i<1) 
            break ; 
        end
        if (IsBlack(p(x-i,y-i)))
            break ; 
        end
        if (p(x-i,y-i) == 101 || p(x-i,y-i) == 202)
            possible(x-i,y-i) = 1 ; 
        else
            possible(x-i,y-i) = 1 ; 
            break ; 
        end
    end
    
    for i = 1:8
        if (x+i>8 || y-i<1) 
            break ; 
        end
        if (IsBlack(p(x+i,y-i)))
            break ; 
        end
        if (p(x+i,y-i) == 101 || p(x+i,y-i) == 202)
            possible(x+i,y-i) = 1 ; 
        else
            possible(x+i,y-i) = 1 ; 
            break ; 
        end
    end
    for i = 1:8
        if (x-i<1 || y+i>8) 
            break ; 
        end
        if (IsBlack(p(x-i,y+i)))
            break ; 
        end
        if (p(x-i,y+i) == 101 || p(x-i,y+i) == 202)
            possible(x-i,y+i) = 1 ; 
        else
            possible(x-i,y+i) = 1 ; 
            break ; 
        end
    end
end
          