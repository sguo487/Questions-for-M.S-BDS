function Y = mlpRegPred(model, X)
% Multilayer perceptron regression prediction
% tanh/sigmoid activation function is used.
% Input:
%   model: model structure
%   X: d x n data matrix
% Ouput:
%   Y: p x n response matrix

W = model.W;
b = model.b;
T = length(W);
Y = X';
for t = 1:T-1
    Y = tanh(W{t}'*Y+b{t});
end
Y = W{T}'*Y+b{T};