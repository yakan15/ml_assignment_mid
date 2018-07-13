function [w,n_hinge_loss,n_dual_lagrange] = problem3(lambda,eta)
%PROBLEM3 この関数の概要をここに記述
%   詳細説明をここに記述
clc;clf;
[X,y] = sampledata(5,100);
X = [ones(size(X,1),1) X];
n_iter = 20000;

w = zeros(size(X,2),1);
alpha = zeros(size(X,1),1);

n_hinge_loss = zeros(n_iter,1);
n_dual_lagrange = zeros(n_iter,1);

for i=1:n_iter
    alpha = projected_gradient(X,y,alpha,lambda,eta);
    w = weight(X,y,alpha,lambda);
    n_hinge_loss(i) = hinge_loss(w,X,y,lambda);
    n_dual_lagrange(i) = dual_lagrange(X,y,alpha,lambda);
    if abs(n_hinge_loss(i)-n_dual_lagrange(i))<10^(-3)
        break;
    end
end
hold on;
step=linspace(-3,3,20);
x2 = -(w(2)*step+w(1))/w(3);
plot(step,x2);
n_hinge_loss = n_hinge_loss(1:i);
n_dual_lagrange = n_dual_lagrange(1:i);
fprintf("iteration terminated:%d",i);
end

