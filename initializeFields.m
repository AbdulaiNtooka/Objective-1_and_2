function F = initializeFields(P,G)

%==========================================================
%
% Initial Guess
%
%==========================================================

F.u = 1 - G.r.^2;

F.theta = ones(G.Nr,1);

F.phi = ones(G.Nr,1);

end