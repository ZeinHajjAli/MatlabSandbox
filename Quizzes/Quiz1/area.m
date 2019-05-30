% Zein Hajj-Ali
% 101020677

function [A] = area(M, ACross, gamma)
% Finds area at point if mach number is known
%
% Inputs:
% M: mach number (should be between 0 and 1
% ACross: Cross sectional area at choke point
% gamma: specific hear ratio for the gas
%
% Output:
% A: cross sectional area at the point of interest

if M > 0
    if M <= 1
        A = (ACross./M).*((2./(gamma + 1)).*(1+(((gamma-1)./2).*(M.^2)))).^((gamma+1)./(2.*(gamma-1)));
    else
        error('M out of range');
    end
else
    error('M out of range');
end

end

