function newList = commonRows(list1, list2)
%newList = commonRows(list1, list2)
%   find the common rows in list1 and list2
newList = [];
for i = 1:size(list1,1)
   if isInList(list1(i,:),list2)
       newList = [newList; list1(i,:)];
   end
end

end

