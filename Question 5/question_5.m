%% FOR 5.A
clc;
clear;

bead_dict = containers.Map;

for i = 0:24
    if i < 13
        id = num2str(i);
        bead_dict(id) = 'B';
    else
        id = num2str(i);
        bead_dict(id) = 'R';
    end
end

pic = zeros(5,5);

seted = 0;
x = 1;
y = 1;

while y < 6
    id = num2str(seted);
    pic(y,x) = bead_dict(id);
    seted = seted +1;
    x = x + 2;
    if x > 5
        y = y + 1;
        if mod(y,2) == 1;
            x = 1;
        else
            x = 2;
        end
    end
end

x = 2;
y = 1;
while y < 6
    id = num2str(seted);
    pic(y,x) = bead_dict(id);
    seted = seted +1;
    x = x + 2;
    if x > 5
        y = y + 1;
        if mod(y+1,2) == 1
            x = 1;
        else
            x = 2;
        end
    end
end

disp(char(pic))

%% FOR 5.B
clc;
clear;
%  create a dictionary to store the beads value 
bead_dict = containers.Map;

% add beads value to bead_dict
% bead_dict -> 'B' : 1451,  'W' : 1072, 'G':977, 'Y':457, 'R':139
for i = 0:4095
   
    if i < 1451
        id = num2str(i);               % transfer num to str as keys
        bead_dict(id) = 'B';           % add value to dic
    elseif ((i>=1451) && (i<2523))
        id = num2str(i);
        bead_dict(id) = 'W';
    elseif ((i>=2523) && (i<3500))
        id = num2str(i);
        bead_dict(id) = 'G';
    elseif ((i>=3500) && (i<3957))
        id = num2str(i);
        bead_dict(id) = 'Y';
    else
        id = num2str(i);
        bead_dict(id) = 'R';
    end
end

% creat L*L grid
pic = zeros(64,64);

% used to locate key in bead_dict  eg. bead_dict(seted)='B'
seted = 0;



% 1st Traversal，Place the charcter from dic at interval 
% from left top of the grid
x = 1; 
y = 1; 
while y < 65
    id = num2str(seted); 
    pic(y,x) = bead_dict(id); % Assign the read character to the 
                              % corresponding position of the two-dimensional array
                              
    seted = seted +1; % get the key for next character
    x = x + 2; % get position every other row
    if x > 64 % change to the next row  when the current row is full
        y = y + 1; % 
        if mod(y,2) == 1; % the odd row index of x
            x = 1;
        else
            x = 2; % the even row index of x
        end
    end
end

% Traverse the above unread matrix positions and repeat the operation
x = 2;
y = 1;
while y < 65
    id = num2str(seted);
    pic(y,x) = bead_dict(id);
    seted = seted +1;
    x = x + 2;
    if x > 64
        y = y + 1;
        if mod(y+1,2) == 1
            x = 1;
        else
            x = 2;
        end
    end
end

% output pic,trasfer ASCII to character
disp(char(pic))
