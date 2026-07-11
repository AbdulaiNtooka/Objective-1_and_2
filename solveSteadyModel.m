function Result = solveSteadyModel(P)

%======================================================================
%
% solveSteadyModel.m
%
% Steady-State Solver
%
%======================================================================

%% --------------------------------------------------------
% Update Derived Properties
%% --------------------------------------------------------

P = updateDerivedProperties(P);

%% --------------------------------------------------------
% Computational Grid
%% --------------------------------------------------------

G = generateGrid(P);

%% --------------------------------------------------------
% Initial Guess
%% --------------------------------------------------------

F = initializeFields(P,G);

u     = F.u;
theta = F.theta;
phi   = F.phi;

%% --------------------------------------------------------
% Nonlinear Iteration
%% --------------------------------------------------------

error = 1;

iter = 0;

fprintf('\n');
fprintf('==============================================\n');
fprintf('STEADY NONLINEAR ITERATION\n');
fprintf('==============================================\n');

while error > P.tol

    iter = iter + 1;

    %% Previous Iteration

    uOld     = u;
    thetaOld = theta;
    phiOld   = phi;

    %% Solve Governing Equations

    u     = assembleMomentumSteady(u,P,G);

    theta = assembleEnergySteady(theta,u,P,G);

    phi   = assembleConcentrationSteady(phi,P,G);

    %% Relative Error

    errU = norm(u-uOld,inf) ...
        /max(norm(u,inf),1e-12);

    errT = norm(theta-thetaOld,inf) ...
        /max(norm(theta,inf),1e-12);

    errC = norm(phi-phiOld,inf) ...
        /max(norm(phi,inf),1e-12);

    error = max([errU errT errC]);

    fprintf('Iteration %3d Error = %.3e\n',iter,error);

    if iter>=P.maxIter

        warning('Maximum iterations reached.')

        break

    end

end

%% --------------------------------------------------------
% Engineering Quantities
%% --------------------------------------------------------

[Cf,Nu,Sh] = engineeringQuantities(...
    u,...
    theta,...
    phi,...
    P,...
    G,...
    false);

%% --------------------------------------------------------
% Store Results
%% --------------------------------------------------------

Result.r = G.r;

Result.u = u;

Result.theta = theta;

Result.phi = phi;

Result.Cf = Cf;

Result.Nu = Nu;

Result.Sh = Sh;

Result.iter = iter;

end