function y = sigmoid(x)
% Sigmod function

% y = exp(-log1pexp(-x));
y= 1 ./ (1 + exp(-x));