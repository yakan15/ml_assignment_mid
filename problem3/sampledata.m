function [X,y] = sampledata(seed,n)
%SAMPLEDATA この関数の概要をここに記述
%   詳細説明をここに記述

rng(seed);
omega = randn(1,1);
noise = 0.8*randn(n,1);

X = randn(n,2);
y = 2 * (omega * X(:,1) + X(:,2) + noise >0) -1;

hold off
plot(X(y==1,1),X(y==1,2),'o','MarkerEdgeColor','blue');
hold on
plot(X(y==-1,1),X(y==-1,2),'o','MarkerEdgeColor','red');
xlabel('x1');ylabel('x2');
end

