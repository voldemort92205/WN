function [information] = printInfo(info)
	n = size(info, 2);
	k = (n - mod(n, 4)) / 4;
	for i = 1:k
%		fprintf ('%d %d %d %d ,  ', info(4*i-3), info(4*i-2), info(4*i-1), info(4*i));
%		fprintf ('')
		tmp = info(4*i-3) + 4*info(4*i-2) + 16*info(4*i-1) + 64*info(4*i);
%		fprintf ('%d => %c\n', tmp, char(tmp));
	fprintf ('%c', tmp);
	end

	%n
	%k
	if 4*k == n
		information = [];
	else
		information = info((4*k+1):end);
	end
end
