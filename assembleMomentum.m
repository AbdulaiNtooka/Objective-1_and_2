function uNew = assembleMomentum(u,P,G)

%======================================================================
% assembleMomentum.m
%
% Crank-Nicolson discretization of the momentum equation
%
% rho_r du/dt =
%   -dp/dz
%   + alpha Lap(u)
%   - M*u
%
%======================================================================

N  = G.Nr;
dr = G.dr;
dt = G.dt;

%% Effective Property Ratios

rhoR = P.rhoRatio;

%% Magnetic Parameter

M = P.sigmaRatio*P.Ha^2/P.Re;

%% Apparent Casson Viscosity

muApp = computeCassonViscosity(u,P,G);

alpha = muApp/(P.mu_f*P.Re);

%% Allocate Coefficient Structure

Coeff.a = zeros(N,1);
Coeff.b = zeros(N,1);
Coeff.c = zeros(N,1);
Coeff.d = zeros(N,1);

%% Interior Nodes

for i = 2:N-1

    ri = G.r(i);

    AW = 1/dr^2 - 1/(2*ri*dr);

    AP = -2/dr^2;

    AE = 1/dr^2 + 1/(2*ri*dr);

    %----------------------------------
    % Left-Hand Side
    %----------------------------------

    Coeff.a(i) = -0.5*alpha(i)*AW;

    Coeff.b(i) = rhoR/dt ...
               -0.5*alpha(i)*AP ...
               +0.5*M;

    Coeff.c(i) = -0.5*alpha(i)*AE;

    %----------------------------------
    % Right-Hand Side
    %----------------------------------

    DiffusionOld = alpha(i)*( ...
          AW*u(i-1) ...
        + AP*u(i) ...
        + AE*u(i+1));

    Coeff.d(i) = ...
          rhoR*u(i)/dt ...
        + 0.5*DiffusionOld ...
        - 0.5*M*u(i) ...
        - P.dpdz;

end

%% Centreline
% Symmetry: du/dr = 0

Coeff.a(1) = 0;
Coeff.b(1) = 1;
Coeff.c(1) = -1;
Coeff.d(1) = 0;

%% Wall
% No-slip: u = 0

Coeff.a(N) = 0;
Coeff.b(N) = 1;
Coeff.c(N) = 0;
Coeff.d(N) = 0;

%% Solve Tridiagonal System
checkMomentumMatrix(Coeff);
uNew = TDMA(Coeff);

end