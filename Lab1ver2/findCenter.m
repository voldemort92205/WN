function [x, y] = findCenter (Image)
	
	%given a surface of red of a picture
	%we get a circle when we take a picture of bubble
	%then we can find the center of light in terms of (x,y)

	[row, col] = size(Image);
	brightest = max(max(Image)');
	xSum = sum(Image == brightest);
	ySum = sum(Image' == brightest);

	x = find(xSum == max(xSum));
	y = find(ySum == max(ySum));
	x = x(1);
	y = y(1);
end
