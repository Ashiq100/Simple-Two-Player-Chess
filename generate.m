function [ possible ] = generate (x,y,board_state,turn)
color = floor(board_state(x,y)/100);

if (color ~= turn) 
    possible = zeros(8,8) ;
    return ;
end

piece = Piece(board_state(x,y)) ; 

if (piece == 1)
    possible = pawn_moves(x,y,board_state,turn) ;
elseif (piece == 2)
    possible = bishop_moves(x,y,board_state,turn) ;
elseif (piece == 3)
    possible = knight_moves(x,y,board_state,turn) ;
elseif (piece == 4)
    possible = rook_moves(x,y,board_state,turn) ;
elseif (piece == 5)
    possible = queen_moves(x,y,board_state,turn) ;
elseif (piece == 6)
    possible = king_moves(x,y,board_state,turn) ; 
end
 
end