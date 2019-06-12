% Zein Hajj-Ali
% 101020677

function [B] = DigDom(A)
%DigDom: checks if a given matrix is squared and diagonally dominant.
%Outputs 1 if it is, and 0 otherwise.
% INPUTS:
%   A: matrix to be checked
% OUTPUTS:
%   B: boolean value. 1 if matrix is squared and diagonally dominant. 0
%   otherwise.

[n, nn] = size(A);

B = 1;

% check to see if matrix is squared
if n~=nn
    B = 0;
    return;
end

% loop through rows
for i = 1:n
    %add all rows up and subtract diagonal
    row = sum(A(i, :));
    row = row - A(i, i);
    
    %check to see if row is diagonally dominant
    if abs(A(i, i)) < row
        B = 0;
        return;
    end
end

end

