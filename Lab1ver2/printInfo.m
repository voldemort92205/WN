function [information] = printInfo(info)
	n = size(info, 2);
	k = (n - mod(n, 4)) / 4;
	for i = 1:k
		tmp = info(4*i-3) + 4*info(4*i-2) + 16*info(4*i-1) + 64*info(4*i);
		fprintf ('%c', tmp);
	end

	if 4*k+1 >= n
		information = [];
	else
		information = info((4*k+1):end);
	end
end
