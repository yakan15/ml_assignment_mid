function [weight,acc_next] = accelerated(weight,weight_before,mu,A,lambda,gamma,acc)
%PROXIMAL この関数の概要をここに記述
%   詳細説明をここに記述
%Nesterov acceleration
acc_next = ((1+sqrt(1+4*acc^2))/2);
q = (acc-1)/acc_next;

v = weight + q*(weight-weight_before);
gradf = 2*A*(v-mu);
gd = v - gradf/gamma;
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

