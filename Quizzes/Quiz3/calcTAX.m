% Zein Hajj-Ali
% 101020677

function [ TMAX ] = calcTMAX( m, D, L )
%calcTMAX: given values for m, D, and L calculates ad returns TMAX. TMAX
%lies between 1N and 1*(10^9)N
%
% INPUTS:
%   m: mass per unit length of the cable in kg/m, must be positive
%   D: distance between the two points in meters
%   L: length of the cable in meters
%
% OUTPUTS:
%   TMAX: maximum tension in the cable in Newtons

% g is the acceleration due to gravity given in the question
g = 9.81;

% used to find T0 using 
T0Finder = @(T0) (((2*T0)/(m*g))*sinh((m*g*D)/(T0*2))) - L;
TMAXFinder = @(T0) T0*cosh((m*g*D)/(2*T0));

% set ilow and ihigh to change by 100 each iteration to find a close guess
ilow = 1;
ilowSign = sign(T0Finder(ilow));
for ihigh = 100 : 100 : 10^9
    if ilowSign ~= sign(T0Finder(ihigh))
        break;
    end
    ilow = ihigh;
end

% fzero to find T0 using the rootfinder function
T0 = fzero(T0Finder, [ilow, ihigh]);
% calculate TMAX using the given formula
TMAX = TMAXFinder(T0);


end

