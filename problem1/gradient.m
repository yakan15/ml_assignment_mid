function [grad] = gradient(X,y,weight,lambda)
%GRADIENT 
%   詳細説明をここに記述
% 勾配を計算して返す。
n = size(X,1);

grad = 1/n*(-y.*X)'*((exp(-(y.*X)*weight)).*sigmoid((y.*X)*weight)) + 2*lambda*weight;


end

