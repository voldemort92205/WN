function [information, status] = decode (filename, threshold, status)


	%status : if start get information or not

	image = imread(filename);
	[row, col, high] = size(image);
	[x, y] = findCenter(image(:, :, 1));

%	for i = 1:3
%		subplot (2, 2, i);
%		plot (image(:, y, i));
%		switch i
%			case 1
%				title ('red');
%			case 2
%				title ('green');
%			case 3
%				title ('blue');
%		end
%	end

	%transfere to gray scale
	[red] = colorStripDetect (image(:, y, 1), threshold);	
	[green] = colorStripDetect (image(:, y, 2), threshold);	
	[blue] = colorStripDetect (image(:, y, 3), threshold);	
	
%	subplot (2, 2, 1)
%	plot (red);
%	subplot (2, 2, 2)
%	plot (green);
%	subplot (2, 2, 3)
%	plot (blue)

	
	
	[color, width] = colorCombine(red, green, blue);
	[signal] = detectSignal (color, width);
	[status, information] = colorTransfere (color, width, status, signal);
%	color 
%	width
%	printColor(color, width);
%	information
%	pause()
end
