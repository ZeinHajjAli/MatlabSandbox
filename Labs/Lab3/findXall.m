% Zein Hajj-Ali

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

