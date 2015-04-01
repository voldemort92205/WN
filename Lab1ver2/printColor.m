function printColor(color, width)

	n = size(color, 2);
	for i = 1:n
		if width(i) > 0
			switch color(i)
				case 0
					fprintf ('darker  ');
				case 1
					fprintf ('red  ');
				case 4
					fprintf ('yellow  ');
				case 5
					fprintf ('purple  ');
				case 6
					fprintf ('white  ');
			end
		end
	end
	fprintf ('\n');
end
