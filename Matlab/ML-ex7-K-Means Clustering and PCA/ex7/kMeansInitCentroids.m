function centroids = kMeansInitCentroids(X, K)
%KMEANSINITCENTROIDS This function initializes K centroids that are to be 
%used in K-Means on the dataset X
%   centroids = KMEANSINITCENTROIDS(X, K) returns K initial centroids to be
%   used with the K-Means on the dataset X
%

% You should return this values correctly
centroids = zeros(K, size(X, 2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should set centroids to randomly chosen examples from
%               the dataset X
%
[m n] = size(X);
max_iters = 5;
rand_iters = 5;
J = zeros(rand_iters,1);
rand_centroids = zeros(K,n*rand_iters);

for i = 1:rand_iters
    randidx = randperm(size(X, 1));
    centroids = X(randidx(1:K), :);
    for j=1:max_iters
        idx = findClosestCentroids(X, centroids);
        centroids = computeCentroids(X, idx, K);
    end
    idx = findClosestCentroids(X, centroids);
    for j = 1:K
        x = X(idx == j,:);
        J(i) = J(i) + sum(sum((x-repmat(centroids(j,:),size(x,1),1)).^2));
    end
    rand_centroids(:,n*(i-1)+1:n*i) = centroids;
end

[M,I] = min(J);
centroids = rand_centroids(:,n*(I-1)+1:n*I);



% =============================================================

end

