function P = updateDerivedProperties(P)

%======================================================================
%
% Updates all parameter-dependent properties.
%
%======================================================================

%% Effective Casson Viscosity

P.muEff = P.mu_hnf*(1 + 1/P.beta);

%% Effective Thermal Conductivity

P.kEff = P.k_hnf + (16*P.Rd/3)*P.k_f;

%% Ratios

P.rhoRatio = P.rho_hnf/P.rho_f;

P.muRatio = P.mu_hnf/P.mu_f;

P.muEffRatio = P.muEff/P.mu_f;

P.cpRatio = ...
(P.rho_hnf*P.cp_hnf)/(P.rho_f*P.cp_f);

P.kRatio = P.k_hnf/P.k_f;

P.kEffRatio = P.kEff/P.k_f;

P.sigmaRatio = P.sigma_hnf/P.sigma_f;

%% Diffusion Coefficients

P.alphaT = P.kEffRatio/(P.Re*P.Pr);

P.alphaC = 1/(P.Re*P.Sc);

%% Magnetic Parameter

P.M = P.sigmaRatio*(P.Ha^2)/P.Re;

end