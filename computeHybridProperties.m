function P = computeHybridProperties(P)

%======================================================================
%
% Blood-Based Au-Fe Hybrid Nanofluid Properties
%
% Models
%
% Density                : Mixture Rule
% Heat Capacity          : Mixture Rule
% Viscosity              : Brinkman
% Thermal Conductivity   : Sequential Maxwell
% Electrical Conductivity: Sequential Maxwell
%
%======================================================================

phi = P.phiAu + P.phiFe;

%% --------------------------------------------------------
% Blood
%% --------------------------------------------------------

P.rho_f = 1063;

P.cp_f = 3594;

P.mu_f = 3.5e-3;

P.k_f = 0.492;

P.sigma_f = 0.667;

%% --------------------------------------------------------
% Gold
%% --------------------------------------------------------

rhoAu = 19320;

cpAu = 129;

kAu = 314;

sigmaAu = 4.10e7;

%% --------------------------------------------------------
% Iron
%% --------------------------------------------------------

rhoFe = 7874;

cpFe = 449;

kFe = 80.2;

sigmaFe = 1.0e7;

%% --------------------------------------------------------
% Density
%% --------------------------------------------------------

P.rho_hnf = ...
(1-phi)*P.rho_f ...
+ P.phiAu*rhoAu ...
+ P.phiFe*rhoFe;

%% --------------------------------------------------------
% Heat Capacity
%% --------------------------------------------------------

rhoCp = ...
(1-phi)*P.rho_f*P.cp_f ...
+ P.phiAu*rhoAu*cpAu ...
+ P.phiFe*rhoFe*cpFe;

P.cp_hnf = rhoCp/P.rho_hnf;

%% --------------------------------------------------------
% Brinkman Viscosity
%% --------------------------------------------------------

P.mu_hnf = P.mu_f/(1-phi)^2.5;

%% --------------------------------------------------------
% Sequential Maxwell Thermal Conductivity
%% --------------------------------------------------------

k1 = P.k_f*...
((kAu+2*P.k_f-2*P.phiAu*(P.k_f-kAu))/...
 (kAu+2*P.k_f+P.phiAu*(P.k_f-kAu)));

P.k_hnf = k1*...
((kFe+2*k1-2*P.phiFe*(k1-kFe))/...
 (kFe+2*k1+P.phiFe*(k1-kFe)));

%% --------------------------------------------------------
% Sequential Maxwell Electrical Conductivity
%% --------------------------------------------------------

s1 = P.sigma_f*...
((sigmaAu+2*P.sigma_f-2*P.phiAu*(P.sigma_f-sigmaAu))/...
 (sigmaAu+2*P.sigma_f+P.phiAu*(P.sigma_f-sigmaAu)));

P.sigma_hnf = s1*...
((sigmaFe+2*s1-2*P.phiFe*(s1-sigmaFe))/...
 (sigmaFe+2*s1+P.phiFe*(s1-sigmaFe)));

end