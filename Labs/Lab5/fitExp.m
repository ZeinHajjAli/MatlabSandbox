% Zein Hajj-Ali
% 101020677

function [ D, B ] = fitExp( u, T )
%fitExp: Does a linear and then a curve fit for Andrade's Equation using exponential line fitting techniques
%
% INPUTS:
%   u: dynamic viscosity
%   T: temperature in celsius
%
% OUTPUTS:
%   D: unknown parameter
%   B: unknown parameter

% Transform x values
Ta = T+273.15;
invTa = 1./Ta;

% Transform y values
ut = log(u);

% Polyfit with first order to find best fit line
p = polyfit(invTa, ut, 1);

% Values for plotting
xt = linspace(min(invTa), max(invTa), 100);
yt = polyval(p, xt);

figure(1);
plot(invTa, ut, 'x', xt, yt);
title("Transformed data and best fit line");
xlabel("1/Ta");
ylabel("ln(u)");
grid on;

% Use formulas to find D and B
D = exp(p(2));
B = p(1);

fprintf("The values of D and B that best fit the equation to the data are D = %f, and B = %f", D, B);

% Reverse transformation on linear values to find curve
xt = linspace(max(T), min(T), 100);
yt = exp(yt);


figure(2);
plot(T, u, 'o', xt, yt);
title("Original data and best fit line");
xlabel("T");
ylabel("u");
grid on;

end