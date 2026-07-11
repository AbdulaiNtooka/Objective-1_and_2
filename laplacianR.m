function Lap = laplacianR(f,r,dr)

%======================================================================
%
% Computes
%
% d²f/dr²
%
% +
%
% (1/r)df/dr
%
%======================================================================

N = length(f);

Lap = zeros(N,1);

%% Centreline

Lap(1)=4*(f(2)-f(1))/dr^2;

%% Interior

for i=2:N-1

    d2 = ...
    (f(i+1)-2*f(i)+f(i-1))/dr^2;

    d1 = ...
    (f(i+1)-f(i-1))/(2*dr);

    Lap(i)=d2+d1/r(i);

end

%% Wall

Lap(N)=0;

end