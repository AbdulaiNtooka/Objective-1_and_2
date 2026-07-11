function phiNew = assembleConcentration(phi,P,G)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CONCENTRATION EQUATION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

S = computeSpeciesSource(phi,P);

alpha = (1/(P.Re*P.Sc))*ones(G.Nr,1);

Coeff = assembleCNMatrix( ...
            phi,...
            alpha,...
            S,...
            P,...
            G);

phiNew = TDMA(Coeff);

end