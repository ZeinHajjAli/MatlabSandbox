function [xr] = part4BISECT(f, xl, xu, Edes)
% overlap: calculates overlapping area between two circles
%
% Inputs:
%   f: function to bisect
%   xl: xlower bound
%   xu: xupper bound
% Outputs:
%   xr: xroot of the function within
%
% Zein Hajj-Ali
% 101020677

yl = f(xl);
yh = f(xu);
if sign(yl) == sign(yh)
    error ('no sign change')
end

signOfYl = sign(yl); % keep track of sign of function at xl
for k = 1:1000 % 1000 max iterations
    xr = (xl + xu) /2;
    yr = f(xr);
    Emax = (xu - xl) / 2;
    
    if Emax <= Edes || yr == 0 % error acceptably small or direct hit
        return; % We have finished
    end
    if sign(yr) == signOfYl
        xl = xr;
    else
        xu = xr;
    end
end
error ('Bisection search has not converged to the desired error in 1000 steps '); % most unlikely

end

