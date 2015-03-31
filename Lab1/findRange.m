function [Image, A, B] = findRange(status, width, image)
	t1 = strcmp (status, 'Finish');
	t2 = strcmp (status, 'Begin');
	total = sum(width);
	if t1 == 1
		n = size(image, 1);
		begin = find(width >= 250);
		begin = begin(1);

%		fprintf ('%d of %d(%d)\n', begin, size(width, 1), size(image,1));
		if begin == 1
			%it ends in first strip
			Image = [];
			A = 0;
			B = 0;
		else
			total = sum(width(begin:end));
			Image = image(1:(n-total));
			A = 1;
			B = n-total;
		end
	elseif t2 == 1
	%	total
		n = size(image, 1);
		begin = find(width >= 250);
		begin = begin(1);
		
		if mod(begin, 2) == 0
			if begin+3 >= n
				Image = [];
				A = 0;
				B = 0;
			else
				total = sum(width((begin+3):end));
				Image = image((n-total+1):end);
				A = n-total+1;
				b = n;
			end
		else
			if (begin+2) >= n
				Image = [];
				A = 0;
				B = 0;
			else
				total = sum(width(begin+3:end));
				Image = image((n-total+1):end);
				A = n-total+1;
				B = n;
			end
		end
	end

%	size(Image)

end
