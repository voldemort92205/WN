function [Status, information] = colorTransfere (color, width, status, signal)
	
	n = size(color, 2);
	threshold = 255;
	if signal == 1
		%have signal
		if status == 0
			%not yet get information
			tmp = find(width == max(width));
			tmp = tmp(1);
			for i = tmp:n
				if (width(i) < threshold)
					current = i;
					break;
				end
			end
			tmpColor = color(current:end);
			tmpWidth = width(current:end);
		elseif status == 1
			%means to finish
			tmp = find(width == max(width));
			tmp = tmp(1);
			tmpColor = color(1:(tmp-1));
			tmpWidth = width(1:(tmp-1));
		end
	elseif signal == 0
		%it don't have signal
		if status == 0
			%no start
			tmpColor = [];
			tmpWidth = [];
		elseif status == 1
			tmpColor = color;
			tmpWidth = width;
		end
	end



	n = size(tmpColor, 2);
	
	if n > 0
		current = 1;
		record = linspace (0, 0, n);
		for i = 1:n
			if tmpColor(i) ~= 0
				
				record(current) = convert(tmpColor(i));
				current = current+1;
			end
		end
		Status = 1;
		information = record(1:(current-1));
	elseif n == 0
		Status = 0;
		information = [];
	end


end
