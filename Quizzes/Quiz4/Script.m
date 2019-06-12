% Zein Hajj-Ali
% 101020677

% Part 3:

% input statements
A = input('Input a coefficient matrix A: \n');
b = input('Input the right hand side vector b: \n');

% check useing DigDom
if DigDom(A) == 1
    % Use GuassSeidel method to find solution
    x = GaussSeidel(A, b, 0.001, 10000);
    % Print all elements out
    for i = 1:length(x)
        fprintf("Unknown x%f = %f", i, x(i));
    end
else
    [n, nn] = size(A);
    % check to see if it is squared
    if n==nn
        % left division
        x = A\b;
    else
        fprintf("The matrix entered is not squared \n")
    end
end
        