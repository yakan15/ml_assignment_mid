function [weight,n_weight,n_loss,n_loss_diff] = problem1(lambda,alpha)
%STEEPGD この関数の概要をここに記述
%   詳細説明をここに記述
%{
n_iter:繰り返しの回数
n_loss:繰り返しごとの目的関数の値
n_wewight:繰り返しごとの重みの値
%}
close all;clc;

[X,y] = sampledata(5453,400);

n = size(X,1);

n_iter = 100;
n_loss = zeros(n_iter,1);
n_loss_neuton = zeros(n_iter,1);
X_1 = [ones(size(X,1),1) X];

X_test = X_1(351:400,:);
y_test = y(351:400,:);

X_1 = X_1(1:150,:);
y = y(1:150,:);

% alpha = 1/4*max(eig(1/n*(X_1')*X_1+2*lambda*eye(size(X_1,2))));
fprintf("alpha=%d\n",alpha);
n_weight = zeros(n_iter,size(X_1,2));
n_weight_neuton = zeros(n_iter,size(X_1,2));
n_loss_diff = zeros(n_iter,1);
n_loss_diff_neuton = zeros(n_iter,1);
weight = zeros(size(X_1,2),1);
weight_neuton = zeros(size(X_1,2),1);

% steepest gradient descent
loss_ini = objective(X_1,y,weight,lambda);
for i = 1:n_iter
    weight = weight - alpha*gradient(X_1,y,weight,lambda);
    n_weight(i,:) = weight';
    n_loss(i) = objective(X_1,y,weight,lambda);
    if i>1
        n_loss_diff(i)=n_loss(i)-n_loss(i-1);
    end
end
for i = 1:n_iter
    weight_neuton = weight_neuton + neuton(X_1,y,weight_neuton,lambda);
    n_weight_neuton(i,:) = weight_neuton';
    n_loss_neuton(i) = objective(X_1,y,weight_neuton,lambda);
    if i>1
        n_loss_diff_neuton(i)=n_loss_neuton(i)-n_loss_neuton(i-1);
    end
end

pred = 2*(X_test*weight>0)-1;
step=linspace(-4,4,20);
x2 = -(weight(2)*step+weight(1))/weight(3);
plot(step,x2);
acc_tst=sum(pred==y_test)/size(X_test,1)*100;
fprintf("accuracy:%d",acc_tst);
f2 = figure;
figure(f2);
iter = linspace(1,n_iter+1,n_iter+1);
plot(iter,[loss_ini;n_loss],'-o',iter,[loss_ini;n_loss_neuton],'-o');
end

