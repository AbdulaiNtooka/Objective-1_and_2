function S = computeEnergySource(u,P,G)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENERGY SOURCE TERM
%
% Joule Heating
%
% +
%
% Viscous Dissipation
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dudr = gradientR(u,G.dr);

viscous = ...
P.Ec ...
.*(dudr.^2);

joule = ...
P.Ec ...
.*P.sigmaRatio ...
.*P.Ha^2 ...
.*(u.^2);

S = viscous + joule;

end