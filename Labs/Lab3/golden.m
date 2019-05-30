% Zein Hajj-Ali

function [xmin] = golden(f, xlow, xhigh, Edes)
%golden: Uses the golden ratio search algorithm to minimise the function
%between xlow and xhigh
%
% INPUTS:
%   f: function of single variable to be minimized
%   xlow: lower bound of function to be minimized
%   xhigh: upper bound of function to be minimized
%   Edes: desired error tolerance of minimized value
%
% OUTPUTS:
%   xmin: value of x at which f will have a local minimum

p1 = ((1 + sqrt(5))/2) - 1;

x1 = xlow + p1 * (xhigh - xlow);
fx1 = f(x1);
x2 = xhigh - p1 * (xhigh - xlow);
fx2 = f(x2);
X0 = xhigh-xlow;

for k = 1 : 10000
    Emax = (X0*p1^(k-1)) / 2;
    
    if Emax <= Edes
        xmin = (xlow + xhigh) / 2;
        return;
    end
    
    if fx2 < fx1
        xhigh = x1;
        x1 = x2;
        fx1 = fx2; % old x2 becomes new x1
        x2 = xhigh - p1 * (xhigh - xlow);
        fx2 = f(x2); % brand new x2 required
    else
        xlow = x2;
        x2 = x1;
        fx2 = fx1; % old x1 becomes new x2
        x1 = xlow + p1 * (xhigh - xlow);
        fx1 = f(x1); % brand new x1 required
    end
end

error ('Golden section search has not converged.');

end