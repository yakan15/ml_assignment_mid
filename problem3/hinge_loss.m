function [loss] = hinge_loss(weight,X,y,lambda)
%HINGE_LOSS この関数の概要をここに記述
%   詳細説明をここに記述
loss = sum(max(0,1-(y.*X)*weight))+lambda*(weight')*weight;
end

