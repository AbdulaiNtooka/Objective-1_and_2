function u = assembleMomentumSteady(uOld,P,G)

%======================================================================
%
% Steady Momentum Equation
%
% -alpha*Lap(u)+M*u=G
%
%======================================================================

N = G.Nr;

dr = G.dr;

alpha = P.muEffRatio/P.Re;

M = P.M;

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

    Coeff.b(i)=-alpha*AP+M;

    Coeff.c(i)=-alpha*AE;

    Coeff.d(i)=P.G;

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

u=TDMA(Coeff);

end