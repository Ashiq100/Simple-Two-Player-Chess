function y = InCheck(p,turn)

kx = 0 ; ky = 0 ; 

for i = 1:8
    for j = 1:8
        if (Col(p(i,j)) == turn && Piece(p(i,j)) == 6)
            kx = i ;
            ky = j ; 
            break ; 
        end
    end
end


turn = mod(turn,2) + 1 ;

possible = zeros(8); 

for i = 1:8
    for j = 1:8
        if (Col(p(i,j)) == turn && Piece(p(i,j)) > 0)
            possible = generate(i,j,p,turn) ; 
            if (possible(kx,ky) == 1)
                y = 1 ; 
                return ;
            end
        end
    end
end
y = 0 ; 
end