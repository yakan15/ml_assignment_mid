function [lagrange] = dual_lagrange(X,y,alpha,lambda)
%DUAL_LAGRANGE この関数の概要をここに記述
%   詳細説明をここに記述

lagrange = -1/(4*lambda)*alpha'*(y.*X)*(y.*X)'*alpha +sum(alpha);

end

