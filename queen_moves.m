function [possible] = queen_moves(x,y,p,turn)
p1 = rook_moves(x,y,p,turn) ; 
p2 = bishop_moves(x,y,p,turn) ; 
possible = zeros(8) ; 
for i = 1:8
    for j = 1:8
        if (p1(i,j) == 1 || p2(i,j) == 1)
            possible(i,j) = 1 ; 
        end
    end
end
end