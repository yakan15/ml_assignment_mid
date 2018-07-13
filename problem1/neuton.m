function [dir] = neuton(X,y,weight,lambda)
%NEUTON この関数の概要をここに記述
%   詳細説明をここに記述
n = size(X,1);
hessian = 1/n*(sigmoid((y.*X)*weight).*(1-sigmoid((y.*X)*weight)).*X)'*X + 2*lambda*eye(size(X,2));
grad = gradient(X,y,weight,lambda);
dir = -inv(hessian)*grad;
end

