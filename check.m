function [p] = check(handles,last,cur,turn,board_state) 
p = board_state;
lx = floor(last/10) ; 
ly = mod(last,10) ;
cx = floor(cur/10) ; 
cy = mod(cur,10) ; 
dat = p(lx,ly) ;
col = floor(dat/100) ;
piece = mod(floor(dat/10),10) ; 
lbg = mod(dat,10) ;

if ( (turn == 0 && col == 2) || (turn == 1 && col == 1) || piece == 0)  
    output = 0 ;
    msgbox('Invalid move') ; 
    return p;
end



output = 1 ;

if (lbg == 1)
    p(lx,ly) = 101 ; 
    set(handles.(sprintf('pb%d',last)) , 'Cdata' , imread('101.png')) ;
else
    p(lx,ly) = 202 ; 
    set(handles.(sprintf('pb%d',last)) , 'Cdata' , imread('202.png')) ;
end

cdat = 100*col + 10*piece + mod((cx+cy),2) + 1 ; 
p(cx,cy) = cdat;
set(handles.(sprintf('pb%d',cur)) , 'Cdata' , imread(sprintf('%d.png',cdat)) ) ;
return p;
end