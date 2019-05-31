function [area] = overlap(R1, R2, D)
% overlap: calculates overlapping area between two circles
%
% Inputs:
%   R1: radius of first circle (mm)
%   R2: radius of second circle (mm)
%   D: distance between center of circles (mm)
% Outputs:
%   area: overlapping area between circles (square mm)
%
% Zein Hajj-Ali
% 101020677

% Invalid inputs (outputs error message)
if (R1 <= 0 || R2 <= 0 || D < 0)
    error("Input arguments are invalid; R1 & R2 must be positive; D must not be negative");
end

% Case where they do not overlap (area is zero)
if (D >= R1+R2)
    area = 0;
    return;
end

% Case where one is completly inside the other (area is the area of the
% smaller circle)
if (D < abs(R1-R2))
    area = pi*(min(R1, R2)^2);
    return;
end

% Find values of x1 and x2
x1 = (D^2 + R1^2 - R2^2)/(2*D);
x2 = D - x1;

% Anonymous function to find overlapping area of each circle
A = @(x, R) ((pi*(R^2))/2) - (((x*(((R^2) - (x^2))^(1/2))) + ((R^2)*asin(x/R))));

% total overlapping area
area = A(x1, R1) + A(x2, R2);

return;

end

