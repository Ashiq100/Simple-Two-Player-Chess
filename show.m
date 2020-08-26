function y = show(handles,board_state,possible)
for i = 1:8
    for j = 1:8
        if (possible(i,j) == 1)
            s = 'images/';
            s = strcat(s, num2str(board_state(i,j)+2));
            s = strcat(s,'.png') ; 
            bg = imread(s);
            set(handles.(sprintf('pb%d%d',i,j)) , 'CData' , bg) ;
        end
    end
end
end