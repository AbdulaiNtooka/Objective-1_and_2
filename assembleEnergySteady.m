function theta = assembleEnergySteady(thetaOld,u,P,G)

%======================================================================
%
% Steady Energy Equation
%
% -alphaT*Lap(theta)=Source
%
%======================================================================

N=G.Nr;

dr=G.dr;

alpha=P.alphaT;

dudr=gradientR(u,dr);

Source=...
P.Ec*P.muEffRatio*(dudr.^2)+...
P.Ec*P.sigmaRatio*(P.Ha^2).*(u.^2);

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

    Coeff.b(i)=-alpha*AP;

    Coeff.c(i)=-alpha*AE;

    Coeff.d(i)=Source(i);

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

theta=TDMA(Coeff);

end