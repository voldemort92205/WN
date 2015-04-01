clear all
close all


code = 'e5d:Dgf62e><4d:Df5d5';
test = double(code);
n = max(size(test));
for i = 1:n
	fprintf ('%d => %s\n', test(i), dec2bin(test(i)));
end
