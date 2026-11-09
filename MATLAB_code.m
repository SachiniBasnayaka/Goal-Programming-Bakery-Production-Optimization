Aeq = [  
    30 10 1 -1 0 0 0 0 0 0;     
    90 17 0 0 1 -1 0 0 0 0;      
    1/650 1/2000 0 0 0 0 1 -1 0 0;    
    1/500 1/1800 0 0 0 0 0 0 1 -1;   
    ];  
  
% Right-hand side of the equality constraints  
beq = [1400000; 1925000; 70; 84];  
   
% Objective function coefficients (column vector) 
f = [0; 0; 1; 0; 0; 1; 0; 1; 0; 1]; % Coefficients in objective 
function  
  
% Lower bounds for the variables (all must be non-negative)  
lb = zeros(10,1);  
  
% Upper bounds (optional, set to inf) 
ub = [];  
  
% Solve the goal programming problem using linear programming  
[x, fval] = linprog(f, [], [], Aeq, beq, lb, ub);  
  
% Extract solution and deviations 
x_solution = x(1:2);  % Decision variables (x1, x2)  
deviations = x(3:end);  % Deviation variables (d1-, d2-, d3-, 
d4-, d5+, d6+)  
  
% Display the solution  
disp('Optimal Production Levels:');  
disp(['Bread: ', num2str(x_solution(1))]);  
disp(['Buns: ', num2str(x_solution(2))]);  
  
disp('Deviations from Goals:');  
disp(deviations);