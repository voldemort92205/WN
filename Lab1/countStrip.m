function [total, high] = countStrip(Image)

	total = 0;
	tail = size(Image);
	if Image(1) < 100
		status = 0;
	elseif Image(1) >= 100
		status = 1;
	end
	high = status;
	for i = 1:tail
		if status == 0 & Image(i) >= 100
			total = total + 1;
			status = 1;
		elseif status == 1 & Image(i) < 100
			total = total + 1;
			status = 0;
		end
	end
end
