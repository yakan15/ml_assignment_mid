function [n_weight,weight,i] = problem2(mu,A,lambda,cvx)
%PROBLEM2 この関数の概要をここに記述
%   詳細説明をここに記述
gamma = 2*max(eig(A));
weight = zeros(size(mu,1),1);
weight_before = zeros(size(mu,1),1);
n_iter = 300;
n_weight = zeros(size(weight,1),n_iter);
acc = 0;%for acceleration
for i=1:n_iter
    weight = soft_threshold(weight,mu,A,lambda,gamma);
    n_weight(:,i)=weight;
%     [tmp,acc] = accelerated(weight,weight_before,mu,A,lambda,gamma,acc);
%     n_weight(:,i) = tmp;
%     weight_before = weight;
%     weight = tmp;
%     if(i>1 & max(abs(n_weight(:,i)-n_weight(:,i-1)))<10^(-10))
%         fprintf("Iteration finished:%d",i);
%         break;
%     end
    
end
n_weight= n_weight(:,1:i);

iter = i;
diff = n_weight-cvx;
semilogy(linspace(1,iter,iter),sqrt(sum(diff.^2)),'-o','MarkerSize',3);
end

