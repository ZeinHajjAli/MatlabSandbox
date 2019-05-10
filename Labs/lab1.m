% Zein Hajj-Ali
% 101020677
% May 10, 2019

% Part 1:

fprintf("Part 1: \n");

% a)

Ba = 250/(1 + (56.75 * exp(-0.17*1)));

fprintf(" a) ans = %f\n", Ba);

% b)

Bb = 250/(1 + (56.75 * exp(-0.17*4)));

fprintf(" b) ans = %f\n", Bb);

% c)

fprintf(" c) function = ");
B = @(t) 250./(1 + (56.75 .* exp(-0.17.*t)))

% d)

d = B(1);

fprintf(" d) ans = %f\n", d);

% e)

e = B(4);

fprintf(" e) ans = %f\n", e);

% f)

f = B([1 4]);

fprintf(" f) ans = %f\n", f);

% g)

figure(1);
fplot(B, [0 40])
title("Figure 1: Plot of B(t) from t = 0 to 40");
xlabel("t (hours)");
ylabel("Number of bacteria (*1000)");

% h)

% B(t) - 150

% i)

fprintf(" i) function = ");

F = @(t) B(t) - 150

% j)

xvec = linspace(0, 40, 50);
yvec = F(xvec);
figure(2);
plot(xvec, yvec)
title("Figure 2: rootfinder plot");
xlabel("t (hours)");
ylabel("Number of bacteria (*1000)");

% k)

root = fzero(F, 25);

fprintf(" k) ans = %f\n", root);

% --------------------------------------------------------

% Part 2:

fprintf("Part 2: \n");

% Root finding formula: (1118.406985*(R^2))-(11.18407*R)-99.9627 = 0

rootFinder = @(R) (1118.406985.*(R.^2))-(11.18407.*R)-99.9627;

% Solution with fzero:

xs = linspace(0, 1, 20);
ys = rootFinder(xs);
figure(3);
plot(xs, ys);
grid on;
title("Figure 3: rootfinder Part 2");
xlabel("Radius (m)");

radiusfzero = fzero(rootFinder, [0.2, 0.4]);

fprintf(" Radius using 'fzero' is %f meters\n", radiusfzero);

diameterfzero = 2*radiusfzero;

fprintf(" Diameter using 'fzero' is %f meters\n", diameterfzero);

radiusroots = roots([1118.406985 -11.18407 -99.9627]);

fprintf(" Radius using 'roots' is %f meters\n", radiusroots(1));

diameterroots = 2*radiusroots;

fprintf(" Diameter using 'roots' is %f meters\n", diameterroots(1));