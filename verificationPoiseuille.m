clc
clear
close all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Verification of the Momentum Solver
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

P = inputParameters();

P = computeHybridProperties(P);

%% Verification Parameters

P.beta = 1e6;

P.Ha = 0;

P.Rd = 0;

P.Ec = 0;

P.Kr = 0;

P.rhoRatio = 1;

P.beta = 1e12;      % Newtonian limit
P.Ha   = 0.0;       % No magnetic field

P.rhoRatio   = 1.0;
P.muRatio    = 1.0;
P.kRatio     = 1.0;
P.cpRatio    = 1.0;
P.sigmaRatio = 1.0;

P.mu_hnf = P.mu_f;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Result = solveModel(P);

figure

plot(Result.r,Result.u,'r','LineWidth',2)

xlabel('r')
ylabel('Velocity')

title('Numerical Velocity')

grid on

fprintf('Maximum Velocity = %e\n',max(Result.u));
fprintf('Minimum Velocity = %e\n',min(Result.u));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

uExact = (P.G*P.Re/4)*(1 - Result.r.^2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure

plot(Result.r,uExact,'k--','LineWidth',2)

hold on

plot(Result.r,Result.u,'r','LineWidth',2)

xlabel('Radius')

ylabel('Velocity')

legend('Analytical','Numerical')

title('Verification of the Momentum Solver')

grid on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Error = max(abs(Result.u-uExact));

fprintf('\n');

fprintf('Maximum Error = %e\n',Error);