clear;
close all;
clc;
%% Regression

x = textread('train_data.txt', '' , 'headerlines', 1)';
y = textread('train_truth.txt', '' , 'headerlines', 1)';

%% set net para
h = [4,4];            % two hidden layers with 4 and 4 neurons
lambda = 1e-2;           

%% dropMout method to crossvalidation the model in order to choose Activation Function
x1=x';
y1=y';
A=[x1,y1];
[m,n] = size(A) ;
P = 0.80 ;

for k=1:10                                  % separate Training data and calculate SSE 
idx = randperm(m)  ;                        % repeat 10 times
Training = A(idx(1:round(P*m)),:) ; 
Testing= A(idx(round(P*m)+1:end),:) ;   

x_train= Training(:,1:3);
y_train= Training(:,4);
x_test= Testing(:,1:3);
y_test= Testing(:,4);

[model(k), L] = mlpReg(x_train',y_train',h,lambda);

y_pre = mlpRegPred(model(k),x_test);
SSE(k) = sum((y_pre'-y_test).^2);
k=k+1;
end
SSE_total = sum(SSE)/10


%%
[model, L] = mlpReg(x,y,h,lambda);
X_test = textread('test_data.txt', '' , 'headerlines', 1);
Y_pre = mlpRegPred(model,X_test)';
%%
figure;
plot(L)             % plot loss
xlim([0 40])
hold on
figure;
plot(x',y','.');    % plot train_data & train_truth
hold on

figure;

plot(X_test,Y_pre,'.');  % plot test_data & predict_data
hold on
hold off

%% output
% writematrix(Y_pre,'test_predicted.txt','Delimiter','tab')
