% Zein Hajj-Ali

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