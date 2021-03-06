function [width, color] = decodeColor(info, num)

	tail = size(info,1);
	width = zeros(num, 1);
	color = zeros(num, 1);
	current = 1;
	status = 0;
	for i = 1:tail
		if (info(i) ~= status)
			color(current) = status;
			current = current + 1;
			status = info(i);
		end
		width(current) = width(current) + 1;
	end
end
