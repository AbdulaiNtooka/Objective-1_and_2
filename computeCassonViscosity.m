function muEff = computeCassonViscosity(P)

%======================================================================
%
% Fully Yielded Casson Model
%
% mu_eff = mu_hnf (1 + 1/beta)
%
%======================================================================

muEff = P.mu_hnf*(1 + 1/P.beta);

end