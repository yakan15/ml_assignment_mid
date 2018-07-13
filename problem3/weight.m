function [weight] = weight(X,y,alpha,lambda)
%WEIGHT この関数の概要をここに記述
%   詳細説明をここに記述
weight = 1/(2*lambda)*sum((alpha.*y.*X))';
end

