function thetaNew = assembleEnergy(theta,u,P,G)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENERGY EQUATION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Source term
S = computeEnergySource(u,P,G);

% Constant diffusion coefficient
alpha = (P.kRatio/(P.cpRatio*P.Re*P.Pr))*ones(G.Nr,1);

% Assemble Crank-Nicolson matrix
Coeff = assembleCNMatrix( ...
            theta,...
            alpha,...
            S,...
            P,...
            G);

% Solve tridiagonal system
thetaNew = TDMA(Coeff);

end