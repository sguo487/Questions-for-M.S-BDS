function newList = unionRows(list1, list2)
%newList = unionRows(list1, list2)
%   find the union of rows in list1 and list2
newList = list1;
for i = 1:size(list2,1)
   if ~isInList(list2(i,:),list1)
       newList = [newList; list2(i,:)];
   end
end

end

