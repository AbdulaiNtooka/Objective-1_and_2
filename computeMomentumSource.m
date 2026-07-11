function S = computeMomentumSource(u,P,G)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MOMENTUM SOURCE TERM
%
% S = -dp/dz - M*u
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

S = zeros(G.Nr,1);

Lorentz = ...
-P.sigmaRatio*P.Ha^2*u/P.Re;

Pressure = ...
-P.dpdz*ones(G.Nr,1);

S = Pressure + Lorentz;

end