function [ T0 ] = calcT0_fp( m, D, sag )
% Zein Hajj-Ali
% 101020677
%
% calcT0_fp: given mass, Distance, and cable sag, calculates T0, the
% tension at the lowest point in the cable from the formula given
%
% INPUTS:
%   m: the mass per unit lengh of the cable in kg/m
%   D: the distance between the two points in meters
%   sag: the cable sag in meters
%
% OUTPUTS:
%   T0: The tension at the lowest point in the cable in Newtons

% If m is less than or equal to zero, return an error
if m <= 0
    error("value for m cannot be less than or equal to zero");
end

g = 9.81; % Acceleration due to gravity in m/sec^2
Ed = 0.0001; % Given desired error

% Given function to calculate the sag
calc_sag = @(T0) (T0/(m*g))*(cosh((m*g*D)/(2*T0)) - 1);

% Modified function to find T0 (rootfinder function)
rootfinder = @(T0) calc_sag(T0) - sag;

xlow = 1; % Initial guess for xlow
ylow = rootfinder(xlow); % Initial ylow using rootfinder

signylow = sign(ylow); % Keeps track of the sign of ylow to compare the guesses to

% Iterates between 100 and 10^9 with steps of 100 to find guesses for the
% premade False_Pos function
for i = 100:100:1000000000
    xhigh = i;
    yhigh = rootfinder(xhigh);
    
    % When a guess is reached that has a differing sign, save xlow and
    % xhigh as the values before and after the change in sign
    if signylow ~= sign(yhigh)
        break;
    else
        xlow = xhigh;
    end
end

% Pass the guesses from above for xlow and xhigh into FALSE_POS to find T0
T0 = FALSE_POS(rootfinder, xlow, xhigh, Ed);

end

