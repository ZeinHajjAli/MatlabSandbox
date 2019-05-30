function [ xroot ] = FALSE_POS( g, x1, x2, Ed )
% Zein Hajj-Ali
% 101020677
%
% FALSE_POS: Uses false position algorithm to find a root of the function g
% within x1 and x2 and error Ed. g(x1) and g(x2) must have different signs
%
% INPUTS:
%   g: defined function with one input and one output to find the root of
%   x1: Initial guess of root
%   x2: Second initial guess of root
%   Ed: desired (accepted) error
%
% OUTPUTS:
%   xroot: x value of found root

iter = 10000; % Maximum number of iterations

% Function at initial guesses must have different signs
if sign(g(x1)) == sign(g(x2))
    error("Function at initial guesses must have differing signs");
end

xold = x1; % keeps track of old guesses to calculate error
signx1 = sign(g(x1)); % keeps track of sign of y1 to compare against new guess

% Iterates up to the maximum number of times
for i = 1:iter 
    xroot = x2 - ((g(x2)*(x2-x1))/(g(x2) - g(x1))); % False position function to find new root
    err = abs(xroot - xold); % Calculation of absolute error
    xold = xroot; % Changes xold to track for next iteration
    
    % If error is acceptable or function is zero, stop/break
    if (err <= Ed) || (g(xroot) == 0)
        return;
    end
    
    % Determines which xvalue to replace, replace the one where the
    % function has the same sign as the new value
    if signx1 == sign(g(xroot))
        x1 = xroot;
    else
        x2 = xroot;
    end
end

error("Function did not converge within 10000 iterations");

end

