clear all
close all


[filename] = textread ('image.txt', '%s');
n = size(filename, 1);
color = [];
for i = 1:n 
	tmp = decode (filename{i});
	%combine old and new message
	if size(color, 1) == 0
		color = tmp;
	else
		color = [color; tmp];
	end
	%if message over 3, convert some message
	size(color);
	if size(color, 1) >= 3
		color = printInfo(color);
	end

end
fprintf ('\n');
