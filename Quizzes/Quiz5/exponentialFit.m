% Zein Hajj-Ali
% 101020677

function [ alpha, beta ] = exponentialFit( x, y )
%exponentialFit: fits a curve of the form "y = alpha*exp(beta*x)" to a
%given set of x and y values.
%
% INPUTS:
%   x: vector containing x values
%   y: vector containing y values
%
% OUTPUTS:
%   alpha: value of alpha from the fitted curve
%   beta: value of beta from the fitted curve

yt = log(y);
xt = x;
p = polyfit(xt, yt, 1);

beta = p(1);
alpha = exp(p(2));

end

