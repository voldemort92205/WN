function [color, width] = clearNoise (info, colorWidth)
	black = find(info == 0);
	tail = size(black);
	color = zeros(black(1)-1, 1);
	width = zeros(black(1)-1, 1);



	for i = 1:(tail(1)-1)
		tmp = find(colorWidth((black(i)+1):(black(i+1)-1)) == max(colorWidth((black(i)+1):(black(i+1)-1))));
		color(i) = info(black(i)+tmp);
		width(i) = colorWidth(black(i)+tmp);
	end

end
