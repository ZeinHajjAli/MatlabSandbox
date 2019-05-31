% Zein Hajj-Ali
% 101020677

xl = 0;
xu = 4;
Edes = 0.0000001;
g = 9.81;
t = 2.5;
L = 4;

f = @(H) sqrt(2*g*H)*tanh(sqrt(((2*g*H)/(2*L))*t));

rootfinder = @(H) f(H)-5;

figure(1);
fplot(rootfinder, [0 4]);
title("f(H) vs H (initial head) for H from 0 to 4");
xlabel("Initial HEad (m)");
ylabel("f(H) - 5");
grid on;

root = part4BISECT(rootfinder, xl, xu, Edes);
fprintf("the intital head needed to achieve v = 5 in 2.5 second for a 4 meter long pipe is %10f \n", root);