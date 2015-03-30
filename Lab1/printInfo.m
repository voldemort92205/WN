function color = printInfo(info)
	n = size(info,1);
	k = (n - (mod(n, 3))) / 3;
	for i = 1:k
		message = (info(3*i-2) + 4 * info(3*i-1) + 16 * info(3*i));
		printThis(message);
	end


	color = info((3*k+1):end);
end
