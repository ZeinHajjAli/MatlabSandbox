% Zein Hajj-Ali
% 101020677

% Part 1:

x = 1:9;
y = [-17.26, 11.92, 21.46, 19.39, 8.63, -1.21, -8.25, -2.27, 19.81];

% a)

p = polyfit(x, y, 3);

fprintf("The third order polynomial that best fits the data given is %fx^3 + %fx^2 + %fx + %f \n", p(1), p(2), p(3), p(4));

% b)

zeroFinder = @(z) polyval(p, z);

z1 = fzero(zeroFinder, [1, 2]);
z2 = fzero(zeroFinder, [5, 6]);
z3 = fzero(zeroFinder, [8, 9]);

fprintf("The values of x at which the fitted curve is zero are x = %f, x = %f, and x = %f \n", z1, z2, z3);

% Part 3:

x = 1:9;
y = [4.436, 5.870, 7.754, 8.817, 10.704, 13.417, 16.579, 20.100, 24.237];

[a, b] = exponentialFit(x, y);

fprintf("The values of alpha and beta are %f and %f respectivly", a, b);

expFunction = @(x) a*exp(b*x);
xt = linspace(1, 9, 100);
yt = expFunction(xt);

figure(1);
plot(x, y, 'x', xt, yt);
title("Plot of data points and fitted exponential curve");
xlabel("x");
ylabel("y");
grid on;

% Part 4:

T = [0, 5, 10, 20, 30, 40];
u = [1.787, 1.519, 1.307, 1.002, 0.7975, 0.6529];

% a)

p = polyfit(T, u, 5);
estimate = polyval(p, 25);

fprintf("The estimated viscosity of water at T = 25C using an interpolating polynomial is u = %f \n", estimate);

% b)

estimate = spline(T, u, 25);

fprintf("The estimated viscosity of water at T = 25C using an cubic spline is u = %f \n", estimate);