function dfdx = gradientR(f,dr)

%======================================================================
%
% Computes
%
% df/dr
%
% Second-order finite differences
%
%======================================================================

N = length(f);

dfdx = zeros(N,1);

%% Centreline

dfdx(1)=(-3*f(1)+4*f(2)-f(3))/(2*dr);

%% Interior

for i=2:N-1

    dfdx(i)=...
    (f(i+1)-f(i-1))/(2*dr);

end

%% Wall

dfdx(N)=...
(3*f(N)-4*f(N-1)+f(N-2))/(2*dr);

end