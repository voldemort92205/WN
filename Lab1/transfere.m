function [Image] = transfere(image)
	%with local compare
	%change to 255 or 0
	%set threshold and MinPeaks to get different mode


	threshold = 50;
	MinPeaks = 90;





	tail = size(image, 1);
	[peaks, loc] = findpeaks(double(image), 'MinPeakHeight', MinPeaks);
	Image = linspace(0, 0, tail);
	n = size(loc, 1);
	current1 = loc(1);
	high1 = image(current1);
	%locMin : where the locmin at between specific range
	%high1, high2 are value

	%handle the start to first peak
	tmp = image(1:(current1-1));

	locMin = find(tmp == min(tmp));
	low = image(locMin);
	half = (high1+low)/2;
	for i = locMin+1:current1
		if image(i) > half
			Image(i) = 255;
		end
	end

	for i = 2:(n)
		current2 = loc(i);
		high2 = image(current2);
		tmp = image((current1+1):(current2-1));
		locMin = find(tmp == min(tmp));
		locMin = locMin(1) + current1;
		low = image(locMin);
		if ((high1-low) >= threshold) & ((high2-low) >= threshold)
		%	fprintf ('range (%d, %d), and (%d, %d, %d)\n', current1, current2, high1, low, high2);
			%left of min
			half = (high1+low) / 2;
			for j = current1:locMin
				if image(j) >= half
					Image(j) = 255;
				end
			end
			%right of min
			half = (high2+low) / 2;
			for j = locMin+1:(current2-1)
				if image(j) > half
					Image(j) = 255;
				end
			end
			current1 = current2;
			high1 = image(current1);
		end
	end
	tmp = image((current1+1):end);
	locMin = find (tmp == min(tmp));
	locMin = locMin(1) + current1;
	low = image(locMin);
    half = (high1+low) / 2;
	for i = current1:tail
		if (image(i) >= half)
			Image(i) = 255;
		end
	end
%	figure(2);
%	plot(Image);
end
