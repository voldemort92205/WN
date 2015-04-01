clear all
close all

threshold = 120;
[filename] = textread ('image.txt', '%s');
n = size(filename, 1);
color = [];
status = 0;
for i = 1:n 
	
%	fprintf ('filename : %s\n',filename{i} );
	[tmp, status]  = decode (filename{i}, threshold, status);
	%combine old and new message
	if size(color, 1) == 0
		color = tmp;
	else
		color = [color, tmp];
	end
	%if message over 3, convert some message
	if size(color, 2) >= 4
		[color] = printInfo(color);
	end
%	color
%pause()
end
fprintf ('\n');
