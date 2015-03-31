function [dec] = convertDec(color)
	n = size(color, 2);
	dec = zeros(n, 1);
	for i = 1:n
		switch color(i) 
			case 1
				dec(i) = 0;
			case 4
				dec(i) = 1;
			case 6
				dec(i) = 2;
			case 5
				dec(i) = 3;
		end
	end
end
