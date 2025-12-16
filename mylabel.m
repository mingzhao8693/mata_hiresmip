function mylabel(xy,corner,s,fsize)
N1=15; N2=35; %N1=40; N2=40; %bottom-left label
N1=15; N2=25; %N1=40; N2=40; %bottom-left label

dx=(xy(2)-xy(1))/N1; 
dy=(xy(4)-xy(3))/N2;
if     corner==1; text(xy(2)-dx, xy(4)-dy, s,'FontSize',fsize);
elseif corner==2; text(xy(1)+dx, xy(4)-dy, s,'FontSize',fsize);
elseif corner==3; text(xy(1)+dx, xy(3)+dy*2, s,'FontSize',fsize);
elseif corner==4; text(xy(2)-dx, xy(3)+dy*2, s,'FontSize',fsize);
end
axis(xy);
return


if     corner==1; text(xy(2)-dx, xy(4)-dy, s,'FontSize',fsize,'EraseMode','xor');
elseif corner==2; text(xy(1)+dx, xy(4)-dy, s,'FontSize',fsize,'EraseMode','xor');
elseif corner==3; text(xy(1)+dx, xy(3)+dy*2, s,'FontSize',fsize,'EraseMode','xor');
elseif corner==4; text(xy(2)-dx, xy(3)+dy*2, s,'FontSize',fsize,'EraseMode','xor');
end
