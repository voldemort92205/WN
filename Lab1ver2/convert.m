function [dec] = convert(value)

	switch value 
		case 1
			%red
			dec = 0;
		case 4
			%yellow
			dec = 1;
		case 6
			%white
			dec = 2;
		case 5
			%purple
			dec = 3;
	end

end
