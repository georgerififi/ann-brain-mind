function find_ground_state()

% construct array of double with all possible combinations of 0s and 1s.
nodes = 9;
states = dec2bin(0:(2^nodes)-1)-'0'; % dec2bin gives a char array. subtract '0', s.t. we get an array of doubles

% make the above array into an array of all possible combinations of -1s and 1s
n = size(states,2);
m = size(states,1);
for i = 1:m
	for j = 1:n
		if states(i,j)==0
			states(i,j) = -1;
		end
	end
end
			
% intialize params
s = states;
sum = 100;
energy = [];

% calculate all possible sums and find the state with the min sum
for i = 1:m
	cand_sum = s(i,1)*s(i,2) + s(i,2)*s(i,3) + s(i,3)*s(i,4) + s(i,4)*s(i,5) + s(i,5)*s(i,6) + s(i,6)*s(i,7) + s(i,7)*s(i,8) + s(i,8)*s(i,9)...
		  - s(i,1)*s(i,6) - s(i,2)*s(i,5) - s(i,5)*s(i,8) + s(i,4)*s(i,9);
	if cand_sum < sum 
		sum = cand_sum;
		ground_state = s(i,:);
		min_index = i;
	end
	energy = [energy ; cand_sum];
end

% display the afformentioned state, also called GROUND STATE
fprintf('ground state is: ')
disp(ground_state)
fprintf('with index: ')
disp(min_index)
plot(energy)

end