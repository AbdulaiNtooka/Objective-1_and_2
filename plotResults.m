function plotResults(Result)

figure('Color','w')

subplot(3,1,1)

plot(Result.r,...
     Result.u,...
     'b',...
     'LineWidth',2.5)

ylabel('Velocity')

title('Velocity Profile')

grid on

subplot(3,1,2)

plot(Result.r,...
     Result.theta,...
     'r',...
     'LineWidth',2.5)

ylabel('\theta')

title('Temperature Profile')

grid on

subplot(3,1,3)

plot(Result.r,...
     Result.phi,...
     'k',...
     'LineWidth',2.5)

xlabel('Dimensionless Radius, r/R_0')

ylabel('\phi')

title('Concentration Profile')

grid on

fprintf('\n');
fprintf('=========================================\n');
fprintf('ENGINEERING QUANTITIES\n');
fprintf('=========================================\n');

fprintf('Iterations : %d\n',Result.iter);

fprintf('Cf : %.6f\n',Result.Cf);

fprintf('Nu : %.6f\n',Result.Nu);

fprintf('Sh : %.6f\n',Result.Sh);

fprintf('=========================================\n');

end