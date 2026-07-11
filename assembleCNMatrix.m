function Coeff = assembleCNMatrix(phi,alpha,source,P,G)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% GENERIC CRANK-NICOLSON MATRIX ASSEMBLER
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N  = G.Nr;

dr = G.dr;

dt = G.dt;

[aDiff,bDiff,cDiff] = buildDiffusionMatrix(alpha,G.r,dr);

Coeff.a = zeros(N,1);
Coeff.b = zeros(N,1);
Coeff.c = zeros(N,1);
Coeff.d = zeros(N,1);

%% Interior Nodes

for i = 2:N-1

    Coeff.a(i) = -0.5*aDiff(i);

    Coeff.b(i) = 1/dt - 0.5*bDiff(i);

    Coeff.c(i) = -0.5*cDiff(i);

    diffusionOld = ...
        aDiff(i)*phi(i-1) ...
        + bDiff(i)*phi(i) ...
        + cDiff(i)*phi(i+1);

    Coeff.d(i) = ...
        phi(i)/dt ...
        + 0.5*diffusionOld ...
        + source(i);

end

%% Centreline

Coeff.a(1)=0;

Coeff.b(1)=1;

Coeff.c(1)=-1;

Coeff.d(1)=0;

%% Wall

Coeff.a(N)=0;

Coeff.b(N)=1;

Coeff.c(N)=0;

Coeff.d(N)=0;

end