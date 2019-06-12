% Zein Hajj-Ali
% 101020677

% PART 3

% Given constant values
D = 40;
m = 2;

% Using the calcTMAX function as a single variable fucntion for
% minimization
oneVarFunction = @(L) calcTMAX(m, D, L);

% given upper and lower bounds for L
Llow = 41;
Lhigh = 60;

% uses the golden function to minimize the the calcTMAX function
Lmin = golden(oneVarFunction, Llow, Lhigh, 0.0001, 10000);

% Find the value for TMAX at the lowest point
TMAXmin = oneVarFunction(Lmin);

fprintf("Minimum TMAX when D = 40, m = 2, and L is between 41 and 60 is %f \n", TMAXmin);

% PART 4

% Coefficient matrix
A = [2, -10, 5;
    5, 6, -2;
    1, 5, 3];
% Right hand side matrix
b = [50;
    5;
    10];

% a)

vinv = inv(A)*b;
fprintf("When using the inverse of the coefficient matrix, x = %f, y = %f, and z = %f \n", vinv(1), vinv(2), vinv(3));

% b)

vleft = A\b;
fprintf("When using left division, x = %f, y = %f, and z = %f \n", vleft(1), vleft(2), vleft(3));

