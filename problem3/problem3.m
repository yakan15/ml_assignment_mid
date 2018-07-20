function [w,n_hinge_loss,n_dual_lagrange] = problem3(lambda,eta)
%PROBLEM3 この関数の概要をここに記述
%   詳細説明をここに記述
clc;close all;
[X,y] = sampledata(0,100);
X = [ones(size(X,1),1) X];
max_iter = 20000;

w = zeros(size(X,2),1);
alpha = zeros(size(X,1),1);

n_hinge_loss = zeros(max_iter,1);
n_dual_lagrange = zeros(max_iter,1);

for i=1:max_iter
    alpha = projected_gradient(X,y,alpha,lambda,eta);
    w = weight(X,y,alpha,lambda);
    n_hinge_loss(i) = hinge_loss(w,X,y,lambda);
    n_dual_lagrange(i) = dual_lagrange(X,y,alpha,lambda);
    if abs(n_hinge_loss(i)-n_dual_lagrange(i))<10^(-2)
        break;
    end
end
hold on;
step=linspace(-3,3,20);
x2 = -(w(2)*step+w(1))/w(3);
plot(step,x2);
n_hinge_loss = n_hinge_loss(1:i);
n_dual_lagrange = n_dual_lagrange(1:i);
% fprintf("iteration terminated:%d",i);
f2 = figure;
figure(f2);
x_iter = linspace(1,i,i);
plot(x_iter,n_hinge_loss,x_iter,n_dual_lagrange);
legend('Loss Function','Dual Function');
xlabel('Iteration');
ylabel('Function Values');
f3 = figure;
figure(f3);
semilogy(x_iter,n_hinge_loss-n_dual_lagrange);
xlabel('Iteration');
ylabel('Gap between Function Values')
end

