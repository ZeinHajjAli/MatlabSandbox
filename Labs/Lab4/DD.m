% Zein Hajj-Ali

function [B] = DD(D)
%DD: checks if a given matrix is diagonally dominant. Returns 1 for
%diagonally dominant and 0 otherwise
%
% INPUTS:
%   D: Matrix to be checked if it is diagonally dominant
%
% OUTPUTS:
%   B: boolean value signifiying dominance

[rows, cols] = size(D);
B = 1;

% iterate through rows
for i = 1 : rows
    
    % store diagonal value
    diag = D(i, i);
    % initialize notDiag variable
    notDiag = 0;
    % iterate through columns
    for k = 1 : cols
        % add every element to notDiag
        notDiag = notDiag + D(i, k);
    end
    % remove the diagonal value
    notDiag = notDiag - diag;
    
    % if any row does not fulfill the criteria, flip the boolean variable
    if abs(diag) < abs(notDiag)
        B = 0;
    end

end

