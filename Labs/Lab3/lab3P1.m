% Zein Hajj-Ali

L = [2, -10, 5; 
    5, 6, -2; 
    1, 5, 3];
R = [50; 5; 10];

soln1 = inv(L)*R;
soln2 = (L^-1)*R;

fprintf("The solutions to x, y, and z using inv() are \n");
fprintf("%f \n", soln1);
fprintf("\nThe solutions to x, y, and z using ^-1 are \n");
fprintf("%f \n", soln2);

soln3 = L\R;

fprintf("\nThe solutions to x, y, and z using left division are \n");
fprintf("%f \n", soln3);
fprintf("The value of y is %f\n", soln3(2));