function [weight] = soft_threshold(weight,mu,A,lambda,gamma)
%PROXIMAL この関数の概要をここに記述
%   詳細説明をここに記述
gradf = 2*A*(weight-mu);
gd = weight - gradf/gamma;
thr = lambda/gamma;
for i = 1:size(weight,1)
    if gd(i) > thr
        weight(i)=gd(i)-thr;
    elseif abs(gd(i)) <= thr
        weight(i) = 0;
    else 
        weight(i) = gd(i)+thr;
    end
end
end

