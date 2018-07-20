function [X,y,X_test,y_test] = sampledata(seed,train,test)
%SAMPLEDATA この関数の概要をここに記述
%   詳細説明をここに記述
% サンプルデータを生成し、
n=train+test;
rng(seed);
omega = randn(1,1);
noise = 0.8*randn(n,1);

X = randn(n,2);
y = 2 * (omega * X(:,1) + X(:,2) + noise >0) -1;
X_test = X(train+1:train+test,:);
y_test = y(train+1:train+test,:);
X = X(1:train,:);
y = y(1:train,:);

hold off
plot(X(y==1,1),X(y==1,2),'o','MarkerEdgeColor','blue');
hold on
plot(X(y==-1,1),X(y==-1,2),'o','MarkerEdgeColor','red');
xlabel('x1')
ylabel('x2')
end

