%% read data and draw polygon 
clear all;
clc;
poly = readmatrix('input_question_6_polygon'); % read polygon data
x1 = poly(:,1);
y1 = poly(:,2);
x1(end+1) = x1(1);                    % for easier connection, add the first point after the last point
y1(end+1) = y1(1);
polyin = polyshape(x1,y1);              
plot(polyin)
hold on


p = readmatrix('input_question_6_points');     % read point data
x2 = p(:,1); 
y2 = p(:,2); 
pn = 10;
p_in = [];
p_out = [];
hold on 

%% check every point location
for k=1:pn                                  
    
    x2 = p(k,1);
    y2 = p(k,2);
    TFin = isinterior(polyin,x2,y2);        % TFin returns a logical vector whose elements are 1 (true) 
    if TFin==1                              % when the corresponding x-coordinates and y-coordinates in the vectors x and y are in a polyshape. 
        p_in = [p_in;x2,y2];                % A point is in a polyshape if it is either in a solid region or on one of the boundaries.
        
    else p_out = [p_out;x2,y2];
         k=k+1;
    end
end

%% plot point data
x3 = p_in(:,1);
y3 = p_in(:,2);
x4 = p_out(:,1);
y4 = p_out(:,2);

plot(x3,y3,'g*')                          
plot(x4,y4,'r*')
p_in = [x3,y3];

%% combine characters with point coordinate
A = [' inside '];
A = repmat(A, size(p_in,1), 1);
output_in = [num2str(p_in,'% d'),A];



B =[' outside'];
B = repmat(B, size(p_out,1), 1);
output_out = [num2str(p_out,'% d'),B];

%% result
OUTPUT = [output_in; output_out]

hold on
hold off


