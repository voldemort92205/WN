function [info, type] = detectColor(red, green, blue)
	%type : num of color
	%info : indicate color order


	thread = 100;
	tail = size(red, 1);
	info = zeros(tail, 1);
	record = zeros(7, 1);
	% 0 for dark, 1 for red, 2 for green, 3 for blue
	% 4 yello (r+g), 5 purple(r+b), 6 white(r+g+b)
	for i = 1:tail
		r = 0;
		g = 0;
		b = 0;
		if (red(i) >= thread)
			r = 1;
		end
		if (green(i) >= thread)
			g = 1;
		end
		if (blue(i) >= thread)
			b = 1;
		end

		pattern = r * 4 + g * 2 + b;
		
		switch pattern
			case 0
				%dark
				info(i) = 0;
				record(1) = 1;
			case 4
				%red
				info(i) = 1;
				record(2) = 1;
			case 2
				%green
				info(i) = 2;
				record(3) = 1;
			case 1
				%blue
				info(i) = 3;
				record(4) = 1;
			case 6
				%yello
				info(i) = 4;
				record(5) = 1;
			case 5
				%purple
				info(i) = 5;
				record(6) = 1;
			case 7
				%white
				info(i) = 6;
				record(7) = 1;
		end
	end
	type = sum(record);
end
