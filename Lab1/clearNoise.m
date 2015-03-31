function [color, width] = clearNoise (info, colorWidth)
	%input :
	%info : color type in order
	%colorWidth : the width of each color 


	%output
	%color : clear some strange color
	%width : the width of each color

	black = find(info == 0);
	tail = size(black, 1);
	color = linspace(0, 0, (tail-1));
	width = linspace(0, 0, (tail-1));
	for i = 1:(tail-1)
		tmp = find(colorWidth((black(i)+1):(black(i+1))) == max(colorWidth((black(i)+1):(black(i+1)))));
%		fprintf ('(%d, %d)\n', black(i), black(i+1));
		color(i) = info(black(i)+tmp(1));
		width(i) = colorWidth(black(i)+tmp(1));
	end
end
