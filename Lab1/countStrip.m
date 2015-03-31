function [total, high] = countStrip(Image)
	
	%    total : how many strips, including black strip
	%    the first status is black strip or color strip
	%

	threshold = 100;
	total = 0;
	tail = size(Image, 1);
%	[peaks1, locHeigh] = findpeaks(double(Image));
	total = 0;
	if Image(1) < 100
		status = 0;
		total = 0;
	elseif Image(1) >= 100
		status = 1;
		total = 1;
	end
	high = status;
	for i = 1:tail
		if status == 0 & Image(i) >= threshold
			total = total + 1;
			status = 1;
		elseif status == 1 & Image(i) < threshold
			total = total + 1;
			status = 0;
		end
	end
end
