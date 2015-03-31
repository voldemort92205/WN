clear all
close all


[filename] = textread ('image.txt', '%s');
n = size(filename, 1);
color = [];
begin = 0;
stop = 1;
for i = 1:n 
	
%	fprintf ('filename : %s\n',filename{i} );
	[tmp, begin, stop]  = decode (filename{i}, begin, stop);
	%combine old and new message
	if size(color, 1) == 0
		color = tmp;
	else
		color = [color; tmp];
	end
	%if message over 3, convert some message
	size(color);
	if size(color, 1) >= 4
		color = printInfo(color);
	end

end
fprintf ('\n');
