function [D] = centredist(R1, R2, area)
% centredist: returns distance from center to center of each circle
%
% Input:
%   R1: radius of first circle in mm
%   R2: radius of second circle in mm
%   area: overlapping area between circles in mm squared
% Output:
%   D: center to center distance in mm
%
% Zein Hajj-Ali
% 101020677

if (area <= 0 || R1 <= 0 || R2 <= 0 || area >= pi*(min(R1, R2)^2))
    error("inputs are invalid; R1, R2, and area must be positive; area must be less than the area of the smaller circle");
end

% D >= abs(R1-R2)
% D < R1+R2
minD = abs(R1-R2);
maxD = R1+R2;

% anonymous function to use overlap as rootfinder
rootfinder = @(distance) overlap(R1, R2, distance) - area;

% fzero with above limits to find desired D
D = fzero(rootfinder, [minD maxD]);

return;

end

