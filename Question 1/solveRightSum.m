function [ops,x] = solveRightSum(m, n, targetNum)
% find target operations given a m x n matrix

% get preliminary solution with least R-operations taken (ignoring n requirement)
x = ones(1,m);
residue = targetNum - sum(1:m);
for k = m:-1:1
    x(k) = floor(residue/k) + 1;
    residue = residue - (x(k)-1)*k;
    if residue == 0
        break;
    end
end
% find the closest solution with n requirement iteratively
% by reducing R ops in last row k and distributing it to row k-1 and row 1
while sum(x) < m+n-1
    loc = find(x-1>0, 1, 'last');
    x(loc) = x(loc) - 1;
    x(loc-1) = x(loc-1) + 1;
    x(1) = x(1) + 1;
end

ops = repmat('R',[1,m+n-2]);
for i=1:length(x)-1
    ops(round(sum(x(1:i)))) = 'D';
end

end