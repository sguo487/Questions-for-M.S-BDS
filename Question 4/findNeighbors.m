function xneighbors = findNeighbors(x, ximage)
%xneighbors = findNeighbors(x)
%	find the non-zero neighboring points around x in ximage (excluding x)
%	with default connectivity = 8

xneighbors = [];

for loc1 = max(1,x(1)-1):min(x(1)+1,size(ximage,1))
    for loc2 = max(1,x(2)-1):min(x(2)+1,size(ximage,2))
        if ximage(loc1,loc2)==0 || (loc1==x(1) && loc2==x(2))
            continue
        else
            xneighbors = [xneighbors; loc1,loc2];
        end
    end
end

end
