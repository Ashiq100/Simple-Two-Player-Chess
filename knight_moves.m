function [possible] = knight_moves(x,y,p,turn)
dx = [ 2 2 -2 -2 -1 1  1 -1] ; 
dy = [-1 1  1 -1  2 2 -2 -2] ; 
possible = zeros(8) ;
if (turn == 1)

for i = 1:8
    xx = x + dx(i) ;
    yy = y + dy(i) ; 
    if (valid(xx,yy) && (NoPiece(p(xx,yy)) || IsBlack(p(xx,yy))))
        possible(xx,yy) = 1 ; 
    end
end

else

    for i = 1:8
    xx = x + dx(i) ;
    yy = y + dy(i) ; 
    if (valid(xx,yy) && (NoPiece(p(xx,yy)) || IsWhite(p(xx,yy))))
        possible(xx,yy) = 1 ; 
    end
end
end

end