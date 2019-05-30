% Zein Hajj-Ali

function [] = Jac_Inv_Sin(A, b)
%Jac_Inv_Sin: given a coefficient matrix and the right hand side vector of
%a system, checks if the matrix is diagonally dominant. If it is, uses
%Jacobi to solve the system of linear equations, if it isn't checks if it
%is singular or not. If it is not singular, solves the system using the
%inverse matrix method. If it is singular, prints out a statement to that
%effect.
%
% INPUTS:
%   A: The coefficient matrix of a system of linear equations
%   b: Right-hand side vector of the system
% 
% OUTPUTS:
%   NONE

% check if the system is diagonally dominant
if DD(A)
    % If it is diagonally dominant, solve using Jacobi and print
    x = Jacobi(A, b);
    fprintf("The system is diagonally dominant \nUsing the Jacobi method the solution was found to be: \n");
    fprintf("%f\n", x);
else
    % Else check if system is singular
    if det(A) ~= 0
        % If it is not singular, solve using inverse matrix method and
        % print
        x = inv(A)*b;
        fprintf("The system is not diagonally dominant nor singular \nUsing the inverse matrix method the solution was found to be: \n");
        fprintf("%f\n", x);
    else
        % Else print that it is singular
        fprintf("This system is singular");
    end
end

end

