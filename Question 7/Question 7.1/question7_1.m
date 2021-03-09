%% 7.1.a equation
% For 2-dimensional grid 
% grid (L1, L2)
% point (X1,X2)

% index = L1*X2 + X1
   
% index/L1 = Quotient.....Remainder  
% X1 = Remainder
% X2 = Quotient


% code
% X1 = mod(index,L1)     
% X2 = idivide(index,L1)


%% 7.1.b

%% convert given coordinates to index
clear;
clc;

co = textread('input_coordinates_7_1.txt', '' , 'headerlines', 1);  % load data

L1 = 50;    % set grid size 
L2 = 57;
X1 = co(:,1); 
X2 = co(:,2);
index = L1*X2 + X1   % calculate index


%% convert given index to coordinates
clear;
clc;
index = textread('input_index_7_1.txt', '' , 'headerlines', 1);
L1 = 50;
L2 = 57;
max(index)            % to confirm int8/16/32
index = int16(index); % convert double to int16

X1 = mod(index,L1);    % calculate index
X2 = idivide(index,L1);

co = [X1,X2]      
