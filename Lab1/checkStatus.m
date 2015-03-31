function [begin, finish] = checkStatus (width, status1, status2)
	%status1 is begin of previous
	%status2 is finsih of previous
	n = size(width, 1);
	larger = find(width(1:(n-1)) < 250);
	if status1 == 0 & status2 == 1
		%not begin
		begin = 1;
		finish = 0;
	elseif status1 == 1 & status2 == 0
		%go to end depens on situation
		if size(larger, 1) == n-1
			begin = status1;
			finish = status2;
		else
			begin = 0;
			finish = 1;
		end
	end
end
