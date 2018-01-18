function [jVal, gradient] = costFunction(theta)

data = csvread('ex1data2.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);

[X_norm mu sigma] = featureNormalize(X);
X_norm = [ones(m, 1) X_norm];

jVal = sum((X_norm * theta - y).^2)/2/m;

n = length(theta);
gradient = zeros(n,1);
    for i = 1:n
        gradient(i) = 1/m * sum((X_norm*theta-y).*X_norm(:,i));  
    end
end