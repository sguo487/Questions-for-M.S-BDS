%% 7.2.a equation
% For d-dimensional grid 
% grid (L1, L2, L3,...Ld)
% point (X1,X2,X3,...Xd)

% index = L1*L2*L3*L4*...*L(d-1)*Xd + L1*L2*L3*L4*...*L(d-2)*X(d-1) + ...
% + L1*L2*X3 + L1*X2 + X1
   
% index/(L1*L2*L3*L4*...*L(d-1)) = Quotient_1.....Remainder_1
% Remainder_1/L1*L2*L3*L4*...*L(d-2) = Quotient_2.....Remainder_2
%                     . . . . . .
% Remainder_2/(L1*L2) = Quotient_(d-2).....Remainder_(d-2)
% Remainder_1/L1 = Quotient_(d-1).....Remainder_(d-1)
%
% 
% X1 = Remainder_(d-1)
% X2 = Quotient_(d-1)
%     . . . . .
% X(d-1) = Quotient_2
% Xd = Quotient_1


% code
% X1 = mod(index,L1)     
% X2 = idivide(index,L1)

%% 7.2.b
%% convert given coordinates to index
clear;
clc;
L1 = 4;
L2 = 8;
L3 = 5;
L4 = 9;
L5 = 6;
L6 = 7;

co = textread('input_coordinates_7_2.txt', '' , 'headerlines', 1);

X1 = co(:,1); 
X2 = co(:,2);
X3 = co(:,3); 
X4 = co(:,4);
X5 = co(:,5); 
X6 = co(:,6);

index = L1*L2*L3*L4*L5*X6 + L1*L2*L3*L4*X5 + L1*L2*L3*X4 + L1*L2*X3 + L1*X2 + X1;

%% convert given index to coordinates
clear;
clc;

index = textread('input_index_7_2.txt', '' , 'headerlines', 1);
L1 = 4;
L2 = 8;
L3 = 5;
L4 = 9;
L5 = 6;
L6 = 7;

max(index)            % to confirm int8/16/32
index = int32(index); % convert double to int32

X6 = idivide(index,L1*L2*L3*L4*L5);
Remainder_1 = mod(index,L1*L2*L3*L4*L5);
X5 = idivide(Remainder_1,L1*L2*L3*L4);
Remainder_2 = mod(Remainder_1,L1*L2*L3*L4);
X4 = idivide(Remainder_2,L1*L2*L3);
Remainder_3 = mod(Remainder_2,L1*L2*L3);
X3 = idivide(Remainder_3,L1*L2);
Remainder_4 = mod(Remainder_3,L1*L2);
X2 = idivide(Remainder_4,L1);
X1 = mod(Remainder_4,L1);

co = [X1,X2,X3,X4,X5,X6];      



