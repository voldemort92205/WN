function [colorType, width] = colorCombine(red, green, blue)
	%for every pixel of r(red), g(green), b(blue)
	%there are 7 kinds of combine, however if there are light, red always show up
	%0 for dark, 1 for red
	%4 for yellow (r+g), 5 for purple(r+b), 6 for white(r+g+b)
	%colorType : represent every pixel's color type
	%width : every color's width
	%we need dark at first


	n = size(red, 2);
	%handle colorType first
	type = linspace(0, 0, n);
	for i = 1:n
		if red(i) == 255
			r = 1;
		else 
			r = 0;
		end
		if green(i) == 255
			g = 1;
		else 
			g = 0;
		end
		if blue(i) == 255
			b = 1;
		else 
			b = 0;
		end


		status = 4*r + 2*g + b;
		switch status
			case 4
				%red
				type(i) = 1;
			case 6				
				%yellow
				type(i) = 4;
			case 5
				%purple
				type(i) = 5;
			case 7 
				%white
				type(i) = 6;
			otherwise
				%dark
				type(i) = 0;
		end
	end

	%count how many color
	status = type(1);
	total = 1;
	for i = 2:n
		if (type(i) ~= status)
			total = total + 1;
			status = type(i);
		end
	end
	if type(1) == 0
		total = total - 1;
	end


	%set color type and the width of each color
	colorType = linspace(0, 0, total+1);
	width = linspace(0, 0, total+1);

	if (type(1) ~= 0)
		%the first strip is not dark
		colorType(1) = 0;
		width(1) = 0;
		colorType(2) = type(1);
		currentFlag = 2;
	elseif (type(1) == 0)
		%dark first
		currentFlag = 1;
	end

	status = type(1);
	currentWidth = 0;
	
	for i = 1:n
		if (type(i) ~= status)			
			currentFlag = currentFlag + 1;
			colorType(currentFlag) = type(i);
			status = type(i);
			currentWidth = 0;
		end
		width(currentFlag) = width(currentFlag)+1;
	end
	
	%clear noise
	
	tmpColor = linspace(0, 0, total+1);
	tmpWidth = linspace(0, 0, total+1);
	tmpWidth(1) = width(1);
	tmpColor(1) = colorType(1);
	bbb = 2;
	aaa = 0;
	for i = 2:total
		if (width(i) < 10)
			aaa = aaa + width(i);
		elseif (width(i) >= 10)
			tmpWidth(bbb) = width(i) + aaa;
			tmpColor(bbb) = colorType(i);
			bbb = bbb + 1;
			aaa = 0;
		end
	end
	tmpWidth(bbb) = width(total+1) + aaa;
	tmpColor(bbb) = colorType(total+1);
	colorType = tmpColor(1:bbb);
	width = tmpWidth(1:bbb);
	
%   between two dark strip , there should be only one kind of color
%   if not, choose the widest color
	darker = find (colorType == 0);
	tmpColor = linspace(0, 0, total+1);
	tmpWidth = linspace(0, 0, total+1);
	n = size(darker, 2);
	for i = 1:(n-1)
		test = width ((darker(i)+1):(darker(i+1)-1));
		err = find (test == max(test));
		err = err(1);
%		fprintf ('error width is : %d\n', width(darker(i) + err));
		tmpColor((2*i-1):(2*i)) = [colorType(darker(i)), colorType(darker(i)+err)];
		tmpWidth((2*i-1):(2*i)) = [width(darker(i)), width(darker(i)+err)];	

		tmpWidth(2*i) = sum(width((darker(i)+1):(darker(i+1)-1)));
	end
	if darker(n) == total+1
		tmpColor(2*n-1) = colorType(darker(n));
		tmpWidth(2*n-1) = width(darker(n));
		final = 2 * n - 1;
	else
		test = width((darker(n)+1):end);
		err = find(test == max(test));
		err = err(1);
		tmpColor((2*n-1):(2*n)) = [colorType(darker(n)), colorType(darker(n)+err)];
		tmpWidth((2*n-1):(2*n)) = [width(darker(n)), width(darker(n)+err)];	
		tmpWidth(2*n) = sum(width((darker(n)+1):end));
		final = 2 * n;
	end
	colorType = tmpColor(1:final);
	width = tmpWidth (1:final);

end
