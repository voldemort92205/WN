function num = colorStrip(info)
	
	%num : number of color

	tail = size(info, 1);
	num = 1;
	current = 0;
	for i = 1:tail
		if (info(i) ~= current)
%			colorType(current);
			num = num + 1;
			current = info(i);
		end
	end
end
