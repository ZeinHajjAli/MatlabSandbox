% Zein Hajj-Ali
% 101020677

x = [4.0 6.0 8.0 10.0 12.0 14.0 16.0 18.0 20.0];
y = [0.0451 0.0538 0.0629 0.0662 0.0695 0.0728 0.0766 0.0782 0.0794];

p = polyfit(x, y, 3);

fprintf("The third order polynomial that best fits the data given is %fx^3 + %fx^2 + %fx + %f \n", p(1), p(2), p(3), p(4));

poly = @(x) p(1)*x^3 + p(2)*x^2 + p(3)*x + p(4);
rootfinder = @(x) poly(x) - 0.065;
root = fzero(rootfinder, [6 12]);

fprintf("The x value between 6 and 12 for which the fitted curve is exactly equal to 0.065 is %f \n", root);

xt = linspace(4, 20, 100);
yt = polyval(p, xt);

figure(1);
plot(x, y, 'x', xt, yt);
title("Plot of the data points and fitted curve");
xlabel("x");
ylabel("y");
grid on;