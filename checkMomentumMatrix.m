function checkMomentumMatrix(Coeff)

fprintf('\n---------------------------------\n');
fprintf('Momentum Matrix Diagnostics\n');
fprintf('---------------------------------\n');

fprintf('Minimum diagonal = %e\n',min(Coeff.b));
fprintf('Maximum diagonal = %e\n',max(Coeff.b));

fprintf('Minimum lower diagonal = %e\n',min(Coeff.a));
fprintf('Maximum lower diagonal = %e\n',max(Coeff.a));

fprintf('Minimum upper diagonal = %e\n',min(Coeff.c));
fprintf('Maximum upper diagonal = %e\n',max(Coeff.c));

if any(isnan(Coeff.b))
    error('NaN detected in main diagonal.');
end

if any(abs(Coeff.b)<1e-12)
    error('Zero diagonal detected.');
end

fprintf('Matrix assembly successful.\n');

end