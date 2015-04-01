function [gray] = colorStripDetect(image, threshold)
	%transfere to dark or bright
	%for every pixel, if the value is greater than or equal to threshold
	%set 255
	%else , set 0
	
	n = size(image, 1);
	gray = linspace (0, 0, n);
	for i = 1:n
		if image(i) >= threshold
			gray(i) = 255;
		else
			gray(i) = 0;
		end
	end

end
