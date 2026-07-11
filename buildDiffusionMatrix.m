function [a,b,c] = buildDiffusionMatrix(mu,r,dr)
% If a scalar coefficient is supplied, expand it over the grid
if isscalar(mu)
    mu = mu*ones(length(r),1);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Builds the tridiagonal diffusion coefficients
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N = length(r);

a = zeros(N,1);

b = zeros(N,1);

c = zeros(N,1);

for i = 2:N-1

    rm = r(i);

    Aw = mu(i)/dr^2 - mu(i)/(2*rm*dr);

    Ap = -2*mu(i)/dr^2;

    Ae = mu(i)/dr^2 + mu(i)/(2*rm*dr);

    a(i)=Aw;

    b(i)=Ap;

    c(i)=Ae;

end

end