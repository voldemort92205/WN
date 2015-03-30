function [infomation] = decode (image)
	filename = image;
	I1 = imread(filename);
	[row, col, heigh] = size(I1);
	
	%approximately center of circle
	[x, y] = findCenter(I1(:, :, 1));
	
	%high determine the first is bright or darker
	%if high is 1, it is bright, if 0, it is dark
	for i = 1:3
		[count, high]= countStrip(I1(:, y, i));
		width = zeros(count, 1);
		[width] = countStripWidth (I1(:, y, i), count);
		subplot(2,2 , i);
		grid on
		plot(1:row, I1(:, y, i));
		if i == 1
			title ('Red');
		elseif i == 2
			title ('Green');
		elseif i == 3
			title ('Blue');
		end
	end

%info => change to color type code
%
	[info, type] = detectColor(I1(:, y, 1), I1(:, y, 2), I1(:, y, 3));
	num = colorStrip(info);
	[colorWidth, info]  = decodeColor(info, num);
	[info, colorWidth] = clearNoise(info, colorWidth);
	infomation = convertDec(info);
end
