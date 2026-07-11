function x = TDMA(Coeff)

%======================================================================
%
% TDMA
%
% Thomas Algorithm
%
% Solves
%
% a(i)x(i-1)+b(i)x(i)+c(i)x(i+1)=d(i)
%
%======================================================================

a = Coeff.a(:);

b = Coeff.b(:);

c = Coeff.c(:);

d = Coeff.d(:);

N = length(b);

%% Forward Elimination

for i = 2:N

    m = a(i)/b(i-1);

    b(i) = b(i)-m*c(i-1);

    d(i) = d(i)-m*d(i-1);

end

%% Back Substitution

x = zeros(N,1);

x(N)=d(N)/b(N);

for i=N-1:-1:1

    x(i)=(d(i)-c(i)*x(i+1))/b(i);

end

end