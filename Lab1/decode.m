function [infomation, Begin, Finish] = decode (image, begin, finish)
%	image = '438.png';
	%infomation : every is two bit but in dec mode

	filename = image;
	I1 = imread(filename);
	[row, col, heigh] = size(I1);
	
	%approximately center of circle
	[x, y] = findCenter(I1(:, :, 1));
	brightDark = zeros(row, 3);	
	%high determine the first is bright or darker
	%if high is 1, it is bright, if 0, it is dark
	for i = 1:3
		subplot(3,3 , 3*i-2);
		grid on
		plot(1:row, I1(:, y, i));
		if i == 1
			title ('Red');
		elseif i == 2
			title ('Green');
		elseif i == 3
			title ('Blue');
		end
%		brightDark(:, i) = transfere(I1(:, y, i));
		[count, high]= countStrip(I1(:, y, i));
		[width] = countStripWidth (I1(:, y, i), count);
		switch i
			case 1
				count1 = count;
				high1 = high;
				width1 = width;
			case 2
				count2 = count;
				high2 = high;
				width2 = width;
			case 3
				count3 = count;
				high3 = high;
				width3 = width;
		end
	end
	[Begin, Finish] = checkStatus(width1, begin, finish);
%	fprintf ('status: (%d, %d) -> (%d, %d)\n', begin, finish, Begin, Finish);
	if begin == 1
		%already begin
		if Finish == 0
			%not end in this picture
%			[info, type] = detectColor(brightDark(:, 1), brightDark(:,2), brightDark(:,3));
			[info, type] = detectColor(I1(:, y, 1), I1(:, y, 2), I1(:, y, 3));
			num = colorStrip(info);
			[colorWidth, info]  = decodeColor(info, num);
			[info, colorWidth] = clearNoise(info, colorWidth);
			infomation = convertDec(info);
		elseif Finish == 1
			%will end in this picture
			%findRange('Finish', width, I1(:, y, 1), I1(:, y, 2), I1(:, y, 3));
			[red, A, B] = findRange('Finish', width1, I1(:, y, 1));
			if A == 0
				blue = [];
				green = [];
			else
				green = I1(A:B, y,2);
				blue = I1(A:B, y,3);
			end
	%		[green] = findRange('Finish', width2, I1(:, y, 2));
	%		[blue] = findRange('Finish', width3, I1(:, y, 3));
			[info, type] = detectColor(red, green, blue);
			num = colorStrip(info);
			[colorWidth, info]  = decodeColor(info, num);
			[info, colorWidth] = clearNoise(info, colorWidth);
			infomation = convertDec(info);
		end
	elseif Begin == 1
		%begin in this picture	
			%[red] = findRange('Begin', width1, I1(:, y, 1));
			[red, A, B] = findRange('Finish', width1, I1(:, y, 1));
			if A == 0
				blue = [];
				green = [];
			else
				green = I1(A:B, y,2);
				blue = I1(A:B, y,3);
			end

			
			%[green] = findRange('Begin', width2, I1(:, y, 2));
			%[blue] = findRange('Begin', width3, I1(:, y, 3));
%			infomation = [];
			[info, type] = detectColor(red, green, blue);
			num = colorStrip(info);
			[colorWidth, info]  = decodeColor(info, num);
			[info, colorWidth] = clearNoise(info, colorWidth);
			infomation = convertDec(info);
	elseif begin == 0
		infomation = [];
	end
end
