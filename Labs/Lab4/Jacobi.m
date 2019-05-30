% Zein Hajj-Ali

function [x] = Jacobi(A, b)
%Jacobi: given a coefficient matrix of a system of linear equations and the
%right-hand side vector, returns the solution of the system of linear
%equations after 1000 iterations and uses 0 for all the unknowns as the
%initial estimate.
%
% INPUTS:
%   A: The coefficient matrix of a system of linear equations
%   b: Right-hand side vector of the system
%
% OUTPUTS:
%   x: vector containing the values of the unknowns

% gets the dimensions of the matricies
[Arows, Acols] = size(A);
[brows, bcols] = size(b);

% initial guess is all zeros
x = zeros(Arows, 1);

% tolerance not stated so set to 0 by default
tol = 0;

% iterations are 1000 by default
iter = 1000;

% If dimensions are incorrect, return with an error
if Arows ~= Acols || Arows ~= brows || bcols ~= 1
    error ('Matrix dimensions are incorrect');
end

% generate the iteration matrices C and d
C = zeros(size(A)); d = zeros(size(b));

for i = 1 : Arows
    if A(i, i) == 0
        error ('zero diagonal element');
    end
    C(i, :) = -A(i, :) / A(i, i);
    C(i, i) = 0;
    d(i) = b(i) / A(i, i);
end

for k = 1 : iter
    
    xold = x;
    
    % Jacobi method
    x = C * xold + d;
    
    % if difference in values is within acceptable error, return
    if norm(x - xold) < tol 
        return; 
    end
end

end

