function isIn = isInList(row, list)
%isIn = isInList(row, list)
%   find list contains row

isIn = false;

for i = 1:size(list,1)
    if all(row == list(i,:))
        isIn = true;
    end
end

end

