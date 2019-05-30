% Zein Hajj-Ali
% 101020677
%
% script_fp

D = 40; % Given distance
m = 2; % Given mass per unit length

% Part i)

% Modified function to find T0 using fp to use only one variable, since the
% given D and m are constant
plotter = @(sag) calcT0_fp(m, D, sag);

% Plot the function from sag = 2 to sag = 20
figure(1);
fplot(plotter, [2 20]);
title("T0 vs sag for sag from 2 to 20 m");
xlabel("Cable sag (m)");
ylabel("Tension at lowest point T0 (Newtons)");
grid on;

% Part ii)

% Initialize sags and array for T0s
sags = 2:0.5:10;
T0s = zeros(length(sags));

fprintf("sag (m)    T0(N) \n");

% Iterates through the array of sags to find T0s and print table elements
for i = 1:length(sags)
    % Evaluate T0 for each array element
    T0s(i) = plotter(sags(i));
    % Print sag and T0 values after evaluating
    fprintf("%5.1f %10.2f \n", sags(i), T0s(i));
end

