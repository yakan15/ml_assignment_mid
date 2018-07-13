function [s] = sigmoid(a)

s = 1.0 ./ (1.0 + exp(-a));