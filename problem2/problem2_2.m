function [weight,weight_acc] = problem2_2(mu,A,lambda)
%PROBLEM2_2 この関数の概要をここに記述
%   詳細説明をここに記述
close all;
cvx_begin;
variables w1 w2;
minimize(([w1;w2]-[1;2])'*[3 0.5;0.5 1]*([w1;w2]-[1;2])+lambda*(abs(w1)+abs(w2)));
cvx_end;

weight = problem2(mu,A,lambda,[w1;w2],0);
hold on;
weight_acc = problem2(mu,A,lambda,[w1;w2],1);
legend('normal','accelerated');
end

