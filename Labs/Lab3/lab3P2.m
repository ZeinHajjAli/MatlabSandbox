% Zein Hajj-Ali

function [] = lab3P2()

% If K=0, x1, x2, and x3 are:
x = findXall(0);
fprintf("If K=0, x1, x2, and x3 are: \n");
fprintf("%f\n",x);

% Plot x1 vs K for K=0 to K=12 using fplot:
findXone = @(K) findX1(K);
figure(1);
fplot(findXone, [0 12]);
title("x1 vs K using fplot");
xlabel("K");
ylabel("x1");
grid on;

% Plot x1 vs K for K=0 to K=12 using plot:
xs = linspace(0, 12, 100);
ys = ones(length(xs));
for i = 1:length(xs)
    ys(i) = findX1(xs(i));
end
figure(2);
plot(xs, ys);
title("x1 vs K using plot");
xlabel("K");
ylabel("x1");
grid on;

% Find minimum value of x1 when K is between 0 and 12
Kmin = golden(findXone, 0, 12, 0.001);
x1min = findXone(Kmin);
fprintf("The minimum K is %f \nThe minimum x1 is %f\n", Kmin, x1min);

end

function [x1] = findX1(K)
%findX1: given constant K, will solve and return the solution to x1 from 
%the system of equations:
%           (5-K)x1 - 2x2 + 4x3 = 10
%           -5x1 + (4+K)x2 + 3x3 = 4
%           5x1 + 2x2 + (1+K)3 = -1
%
% INPUTS:
%   K: a constant in the system of equations above
%
% OUTPUTS:
%   x1: the value of x1 from the system of equations

x = findXall(K);

x1 = x(1);

return;

end

function [x] = findXall(K)
%findXall: given constant K, will solve and return a vector containing the
%solution to x1, x2, and x3 from the system of equations:
%           (5-K)x1 - 2x2 + 4x3 = 10
%           -5x1 + (4+K)x2 + 3x3 = 4
%           5x1 + 2x2 + (1+K)3 = -1
%
% INPUTS:
%   K: a constant in the system of equations above
%
% OUTPUTS:
%   x: a vector containing the values for x1, x2, and x3

L = [5-K, -2, 4;
    -5, 4+K, 3;
    5, 2, 1+K];
R = [10; 4; -1];

x = L\R;

return;

end