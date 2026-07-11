function G = generateGrid(P)

%==========================================================

G.Nr = P.Nr;

G.dr = P.R/(P.Nr-1);

G.r = linspace(0,P.R,P.Nr)';

end