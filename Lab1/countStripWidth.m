function [width] = countStripWidth(Image, num)
	tail = size(Image);
	width = zeros(num, 1);
	current = 1;
	status = 0;
	%0 for not start, 1 for low, 2 for high
	for i = 1:tail
		if (status ~= 0)
			if (status == 1 & Image(i) >= 100)
				status = 2;
				current = current + 1;
			elseif(status == 2 & Image(i) < 100)
				status = 1;
				current = current + 1;
			end
			width(current) = width(current) + 1;
		else
			if (Image(i) >= 100)
				status = 2;
			end
		end
	end
end
