function num = colorStrip(info)
	tail = size(info);
	num = 1;
	current = 0;
	for i = 1:tail(1)
		if (info(i) ~= current)
%			colorType(current);
			num = num + 1;
			current = info(i);
		end
	end
end
