function [total, high] = countStrip(Image)
	
	%    total : how many strips, including black strip
	%    the first status is black strip or color strip
	%

	threshold = 10;
	total = 0;
	tail = size(Image, 1);
%	[peaks1, locHeigh] = findpeaks(double(Image));
%	[peaks2, locLow] = findpeaks(-double(Image));
	
%	num = size(locHeigh, 1);
%	total = num
%	for i = 1:(num)
%		tmp1 = Image(locHeigh(i)) - Image(locLow(i));
%		tmp2 = Image(locHeigh(i)) - Image(locLow(i+1));

%		if tmp1 > threshold | tmp2 > threshold
%			fprintf ('tmp1 : %d, tmp2 : %d\n', tmp1, tmp2);
%		end

%		if (tmp1 < threshold) | (tmp2 < threshold)
%			total = total - 1;
%		end
%	end
%	figure(2);
%	plot (locLow, -peaks2, locHeigh, peaks1);

	total = 0;
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
