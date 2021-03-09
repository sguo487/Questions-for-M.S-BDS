function outImage = findConnectedComponents(inImage)
%outImage = findConnectedComponents(inImage)
%	find and label the connected components in inImage
%	output: labeled image matrix

outImage = zeros(size(inImage));

nCluster = 0; % count the number of connected clusters

unlabeled = inImage; % unlabeled data

% iterate while there is still unlabeled data
while any(unlabeled,'all') 
    % new label for the new cluster of unlabeled data
    nCluster = nCluster + 1;
    % find and label the first unlabeled data point x in the new cluster 
    x = [0,0]; 
    [x(1),x(2)] = find(unlabeled,1);
    outImage(x(1),x(2)) = nCluster;
    unlabeled(x(1),x(2)) = 0;
    % unlabeled data points on the contour of (i.e. directly connected to) 
    % the labeled part
    xcontour = findNeighbors(x, unlabeled); 
    
    % Iterate until there is no unlabeled points on the contour
    while ~isempty(xcontour)
        % select an unlabeled point from the contour
        x = xcontour(1,:);
        % label the point
        outImage(x(1),x(2)) = nCluster;
        unlabeled(x(1),x(2)) = 0;
        % update the contour
        xcontour(1,:) = [];
        xcontour = unionRows(xcontour, findNeighbors(x,unlabeled));
    end
end

end




