% Zein Hajj-Ali
% 101020677

function [xsol] = GaussSeidel(CoefMatrix, rhs, DesE, Imax)
%GaussSeidel: takes the matrix of a system of linear equations, the right
%hand side vector, the desired error, and the maximum number of iterations
%and returns the solution to the system if the desired error is satisfied
%within the maximum number of iterations. Otherwise it returns an error. It
%uses 1 for all the unknowns as the initial estimate.
% INPUTS:
%   CoefMatrix: the coefficient matrix of the system
%   rhs: the right hand side vector of the system 
%   DesE: the desired error
%   Imax: the maximum number of iterations
% OUTPUTS:
%   xsol: the solution vector of the system

A = CoefMatrix;
b = rhs;
[n, nn] = size(A);
[m, mm] = size(b);

% checks if the dimensions are correct
if n~=nn || n~=m || mm~=1
    error("Dimensions are incorrect");
end

% Initializes the iteration matricies
C = zeros(size(A));
d = zeros(size(b));
for i = 1:n
    C(i, :) = -A(i, :)/A(i, i);
    C(i, i) = 0;
    d(i) = b(i)/A(i, i);
end

% Initial guess as per the question is evertything at 1
x = ones(n, 1);

% loops through maximum number of iterations
for k = 1:Imax
    xold = x;
    
    %Guass Seidel method
    for i = 1:n
        x = C(i)*xold + d(i);
    end
    
    % checks if Desired error is reached
    if norm(x) <= DesE
        xsol = x;
        return;
    end
end

% Error if it has not converged
error("GS has not converged within the maximum number of iterations, Imax = %f", Imax);

end

