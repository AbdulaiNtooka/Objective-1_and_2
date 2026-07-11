function P = pressureCorrection(u,P,G)
%======================================================================
% pressureCorrection.m
%
% Updates the axial pressure gradient using the prescribed flow-rate
% constraint.
%
%======================================================================

%% Compute volumetric flow rate

Q = 2*pi*trapz(G.r,u.*G.r);

%% Pressure correction

errorQ = P.Qtarget - Q;

P.dpdz = P.dpdz + P.lambdaP*errorQ;

end