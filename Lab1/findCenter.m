function [x, y] = findCenter (Image)

	[row, col] = size(Image);
	brightest = max(max(Image)');
	xSum = sum(Image == brightest);
	ySum = sum(Image' == brightest);


	x = find(xSum == max(xSum));
	y = find(ySum == max(ySum));
	x = x(1);
	y = y(1);
end
