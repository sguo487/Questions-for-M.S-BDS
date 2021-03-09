%% test
solveRightSum(4, 4, 13)

%% 1.a
ops1 = solveRightSum(9, 9, 65);

ops2 = solveRightSum(9, 9, 72);
ops3 = solveRightSum(9, 9, 90);
ops4 = solveRightSum(9, 9, 110);

%% 1.b
ops5 = solveRightSum(90000, 100000, 87127231192);
ops6 = solveRightSum(90000, 100000, 5994891682); 

%% output
output1 = [num2str(65),ops1]
output2 = [num2str(72),ops2]
output3 = [num2str(90),ops3]
output4 = [num2str(110),ops4]
output5 = [num2str(87127231192),ops5]
output6 = [num2str(5994891682),ops6]

% write result in text
% writematrix(output1,'output_question_1.txt');
% writematrix(output2,'output_question_1.txt','WriteMode','append');
% writematrix(output3,'output_question_1.txt','WriteMode','append');
% writematrix(output4,'output_question_1.txt','WriteMode','append');
% writematrix(output5,'output_question_1.txt','WriteMode','append');
% writematrix(output6,'output_question_1.txt','WriteMode','append');