% Zein Hajj-Ali
% 101020677

% a)

R1 = 100;
R2 = 50;

% Allows us to use overlap as a function of one variable
f = @(D) overlap(R1, R2, D);

% Figure using fplot
figure(1);
fplot(f, [50 160]);
title("Overlapping area vs Distance between centers; Using 'fplot'");
xlabel("Distance between centers 'D' (mm)");
ylabel("Overlapping area (square mm)");
grid on;

% assign distances for plot function
distances = linspace(50, 160);

% Iterate through distances and assign areas
areas = ones(1, length(distances));
for i = 1 : length(distances)
    areas(i) = f(distances(i));
end

% Figure using plot
figure(2);
plot(distances, areas);
title("Overlapping area vs Distance between centers; Using 'plot'");
xlabel("Distance between centers 'D' (mm)");
ylabel("Overlapping area (square mm)");
grid on;

% b)

% Rootfinding problem
rootfinder = @(D) f(D) - 2000;
root = fzero(rootfinder, 100);
fprintf("The value of D where the overlapping area is 2000 square mm is %10f\n", root);

% c)

% Table printing needs a forloop with linspace to use different values of D
tableD = 50:10:160;
tableA = ones(1, length(tableD));
for i = 1 : length(tableD)
    tableA(i) = f(tableD(i));
    fprintf("%.1f \t | %.5f \t \n", tableD(i), tableA(i));
end

% Part 3

c2c = centredist(R1, R2, 2000);
fprintf("USING CENTREDIST.M The value of D where the overlapping area is 2000 square mm is %10f\n", c2c);

% fringe cases
% c2c = centredist(R1, R2, -10)
% c2c = centredist(R1, R2, 0)
% c2c = centredist(R1, R2, 8000)


