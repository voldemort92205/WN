function color = printInfo(info)
	n = size(info,1);
	k = (n - (mod(n, 4))) / 4;
	for i = 1:k
		message = (info(4*i-3) + 4*info(4*i-2) + 16*info(4*i-1) + 64*info(4*i));
%		printThis(message);
	%	fprintf ('%c', message);
		for j = 3:-1:1
			fprintf ('%d ', info(4*i-j));
		end
	end

	if (4*k+1) <= n
		color = info((4*k+1):end);
	else
		color = [];
	end
end
