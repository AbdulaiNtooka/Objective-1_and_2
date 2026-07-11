function phi = assembleConcentrationSteady(phiOld,P,G)

%======================================================================
%
% Steady Species Equation
%
% -alphaC*Lap(phi)+Kr*phi=0
%
%======================================================================

N=G.Nr;

dr=G.dr;

alpha=P.alphaC;

Coeff.a=zeros(N,1);
Coeff.b=zeros(N,1);
Coeff.c=zeros(N,1);
Coeff.d=zeros(N,1);

for i=2:N-1

    r=G.r(i);

    AW=1/dr^2-1/(2*r*dr);

    AP=-2/dr^2;

    AE=1/dr^2+1/(2*r*dr);

    Coeff.a(i)=-alpha*AW;

    Coeff.b(i)=-alpha*AP+P.Kr;

    Coeff.c(i)=-alpha*AE;

    Coeff.d(i)=0;

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
Coeff.d(N)=1;

phi=TDMA(Coeff);

end