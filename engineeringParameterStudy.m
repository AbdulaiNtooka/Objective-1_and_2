function T = engineeringParameterStudy(parameterName,values)

%======================================================================
% Engineering Parameter Study
%======================================================================

n = length(values);

Parameter = zeros(n,1);
Cf = zeros(n,1);
Nu = zeros(n,1);
Sh = zeros(n,1);

for k = 1:n

    %% Read parameters

    P = inputParameters();

    P = computeHybridProperties(P);

    %% Modify selected parameter

    switch lower(parameterName)

        case 'ha'
            P.Ha = values(k);

        case 'beta'
            P.beta = values(k);

        case 'rd'
            P.Rd = values(k);

        case 'ec'
            P.Ec = values(k);

        case 'sc'
            P.Sc = values(k);

        case 'kr'
            P.Kr = values(k);

        case 're'
            P.Re = values(k);

        case 'pr'
            P.Pr = values(k);

        otherwise
            error('Unknown parameter.')

    end

    %% Update derived properties

    P = updateDerivedProperties(P);

    %% Solve

    Result = solveSteadyModel(P);

    %% Store engineering quantities

    Parameter(k) = values(k);

    Cf(k) = Result.Cf;

    Nu(k) = Result.Nu;

    Sh(k) = Result.Sh;

end

%% Create table

T = table(Parameter,Cf,Nu,Sh);

disp(T)

end
fprintf('\n');

fprintf('Wall Temperature Gradient = %e\n',dTdr(end));

fprintf('Nusselt Number           = %e\n',Nu);

fprintf('Sherwood Number          = %e\n',Sh);