function [alpha] = projected_gradient(X,y,alpha,lambda,eta)
%PROJECTED_GRADIENT この関数の概要をここに記述
%   詳細説明をここに記述
tmp = alpha-eta*(1/(2*lambda)*(y.*X)*(y.*X)'*alpha-1);
for i = 1:size(alpha,1)
    if tmp(i)<0
        alpha(i)=0;
    elseif tmp(i)>1
        alpha(i)=1;
    else
        alpha(i)=tmp(i);
    end
    
end
end

