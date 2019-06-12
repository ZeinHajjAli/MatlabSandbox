% Zein Hajj-Ali
% 101020677

K = [300, 305, 310, 315, 320];
Cp = [4.1354, 10.0120, 6.5956, 3.5266, 2.6559];

% Part a)

% i.

p = polyfit(K, Cp, length(K)-1);

fprintf("Value of Cp at temperature of 303K using a single interpolating polynomial is: %f \n", polyval(p, 303));
fprintf("Value of Cp at temperature of 312K using a single interpolating polynomial is: %f \n", polyval(p, 312));

% ii.

fprintf("Value of Cp at temperature of 303K using a regular cubic spline is: %f \n", spline(K, Cp, 303));
fprintf("Value of Cp at temperature of 312K using a regular cubic spline is: %f \n", spline(K, Cp, 312));

% Part b)

xt = linspace(min(K), max(K), 100);

yt1 = polyval(p, xt);

s = @(x) spline(K, Cp,x);
yt2 = s(xt);

figure(1);
plot(K, Cp, 'o', xt, yt1, 'red', xt, yt2, 'black');
title("Plot of data points, interpolating polynomial, and cubic spline");
xlabel("K");
ylabel("Cp");
legend('Data points', 'Interpolating polynomial', 'Cubic spline');
grid on;

% Part c)

interPoly = @(k) polyval(p, k);
rootFinder = @(k) interPoly(k) - 6;
root = fzero(rootFinder, 310);

fprintf("The temperature above 306K at which Cp is 6 is %f \n", root);