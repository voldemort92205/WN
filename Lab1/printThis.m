function printThis(message)
	if message < 10
		fprintf ('%d', message);
	elseif message < 36
		fprintf ('%c', (message-10+97));
	elseif message < 62
		fprintf ('%c', (message - 36 + 65));
	end



end
