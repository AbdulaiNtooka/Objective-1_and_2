function P = inputParameters()

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% INPUT PARAMETERS
%
% MHD FLOW OF A CHEMICALLY REACTIVE CASSON BLOOD-BASED
% Au-Fe HYBRID NANOFLUID IN A DISEASED ARTERY
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% -------------------------------
% GEOMETRY
%% -------------------------------

P.R  = 1.0;          % Dimensionless artery radius
P.L  = 10.0;         % Dimensionless artery length

%% -------------------------------
% GRID
%% -------------------------------

P.Nr = 101;          % Radial grid points

P.dt = 1e-3;         % Time step

P.tEnd = 2.0;        % Simulation time

%% -------------------------------
% FLOW PARAMETERS
%% -------------------------------

P.Re = 10;

P.Ha = 4;

P.beta = 0.5;

P.Pr = 21;

P.Sc = 5;

P.Ec = 0.01;

P.Rd = 0.5;

P.Kr = 0.2;

%% -------------------------------
% HYBRID NANOFLUID PROPERTIES
%% -------------------------------

P.rho = 1;

P.mu = 1;

P.k = 1;

P.cp = 1;

P.sigma = 1;

P.D = 1;

%% -------------------------------
% PRESSURE
%% -------------------------------

P.dpdz = -1;

P.lambdaP = 0.3;

P.Qtarget = pi;

%% -------------------------------
% ITERATION CONTROL
%% -------------------------------

P.maxIter = 100;

P.tol = 1e-6;

end