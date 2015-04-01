function [answer] = detectSignal(color, width)
	%check whether there are wider strip in the information
	%if yes, answer is 1
	%else answer is 0
	%status means wheter getting information before
	%
	threadshold = 230;
	maximum = max(width);
	maximum = maximum(1);
	if (maximum > threadshold)
		answer = 1;
	else
		answer = 0;
	end
end
