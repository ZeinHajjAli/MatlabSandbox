% Zein Hajj-Ali
% 101020677

% Part i)
%   a)
areaInst = @(M) area(M, 0.020, 1.40); % Instintiation as function of one parameter for use in fplot

figure(1);
fplot(areaInst,[0.1 1])
title("Cross sectional area plot when ACross = 0.02, gamma = 1.4, and M from 0.1 to 1 using 'fplot'");
xlabel("Mach number 'M' (Mach)");
ylabel("Cross sectional area (square meters)");
grid on;

%   b)
machNumbers = linspace(0.1, 1, 100); % Make x values (100 points)
areas = area(machNumbers, 0.020, 1.40); % Make y values from x values (could also use areaInst)

figure(2);
plot(machNumbers, areas); % Plot x and y values
title("Cross sectional area plot when ACross = 0.02, gamma = 1.4, and M from 0.1 to 1 (100 points) using 'plot'");
xlabel("Mach number 'M' (Mach)");
ylabel("Cross sectional area (square meters)");
grid on;

% Part ii)

% Find root using area-0.047=0
rootFinder = @(M) area(M, 0.020, 1.40)-0.047;
root = fzero(rootFinder, [0.1 1]); % use fzero to find root between limits of mach number (0.1 - 1)

fprintf("Mach number of the flow at point in nozzle where A=0.047 square meters is %10f\n",root);
