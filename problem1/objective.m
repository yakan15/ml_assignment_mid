function [obj] = objective(X,y,weight,lambda)
%OBJECTIVE この関数の概要をここに記述
%   目的関数を計算した結果を返す。
n = size(X,1);
obj = 1/n*sum(log(1+exp(-(y.*X)*weight)))+lambda*weight'*weight;
end

