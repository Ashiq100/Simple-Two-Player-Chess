function [possible] = king_moves(x,y,p,turn)
dx = [1 1 1 0 0   -1 -1 -1] ;
dy = [1 0 -1 1 -1  1 0  -1] ;
possible = zeros(8) ; 
for i = 1:8
    xx = x + dx(i) ; 
    yy = y + dy(i) ; 
    if (turn == 1)
        if (valid(xx,yy) && (IsBlack(p(xx,yy)) || NoPiece(p(xx,yy))))
            possible(xx,yy) = 1 ; 
        end
    else
        if (valid(xx,yy) && (IsWhite(p(xx,yy)) || NoPiece(p(xx,yy))))
            possible(xx,yy) = 1 ; 
        end
    end
end

end