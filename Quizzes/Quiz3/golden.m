% Zein Hajj-Ali
% 101020677

function [ xmin ] = golden( f, xlow, xhigh, Edes, imax )
%golden: uses the golden ratio search algorithm to minimize the function f
%between xlow and xhigh with a maximum number of iterations imax, and a
%desired error threshold Edes
%
% INPUTS:
%   f: function with one input and one output to be minimized
%   xlow: lower bound for search function
%   xhigh: upper bound for search function
%   Edes: desired error threshold
%   imax: maximum number of iterations for search function
%
% OUTPUTS:
%   xmin: value of x for which f(xmin) is a local minimum

% Define unchanging constants
phiMinus = ((1+sqrt(5))/2) - 1;
x0 = xhigh - xlow;

% Set up values for first iteration
d = phiMinus*(xhigh - xlow);
x1 = xlow + d;
x2 = xhigh - d;
fx1 = f(x1);
fx2 = f(x2);

% Iterate from 1 to maximum number of iterations
for i = 1 : imax
    
    % find value for xmin
    xmin = (xhigh + xlow)/2;
    
    % find Emax to compare against Edes
    Emax = (x0*((phiMinus)^(i-1)))/2;
    if Emax <= Edes
        return;
    end
    
    % run through conditions of next iteration and update values
    if fx1 > fx2
        xhigh = x1;
        x1 = x2;
        fx1 = fx2;
        d = phiMinus*(xhigh - xlow);
        x2 = xhigh - d;
        fx2 = f(x2);
    else
        xlow = x2;
        x2 = x1;
        fx2 = fx1;
        d = phiMinus*(xhigh - xlow);
        x1 = xlow + d;
        fx1 = f(x1);
    end
    
end

% Function only reaches here if Emax on iteration imax is greater than Edes
error('Golden Section search did not converge within max number of intervals');

end