function parameterEffects(parameterName,values)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% parameterEffects.m
%
% Generates the effect of a selected parameter on
%
% Velocity
% Temperature
% Concentration
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Velocity Figure

figure('Color','w');
hold on

colors = lines(length(values));

for k=1:length(values)

    %% Read Parameters

    P = inputParameters();

    P = computeHybridProperties(P);

    %% Change Selected Parameter

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

            error('Unknown parameter.');

    end

    %% Update Derived Properties

    P = updateDerivedProperties(P);

    %% Solve Model

    Result = solveSteadyModel(P);

    %% Plot Velocity

    plot(Result.r,...
         Result.u,...
         'Color',colors(k,:),...
         'LineWidth',2.5);

end

xlabel('Dimensionless Radius, r/R_0');

ylabel('Dimensionless Velocity');

title(['Effect of ',parameterName,' on Velocity']);

legend(string(values),'Location','best');

grid on

%% Save

saveFigure([parameterName '_Velocity']);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Temperature
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('Color','w');
hold on

for k=1:length(values)

    P = inputParameters();

    P = computeHybridProperties(P);

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

    end

    P = updateDerivedProperties(P);

    Result = solveSteadyModel(P);

    plot(Result.r,...
         Result.theta,...
         'Color',colors(k,:),...
         'LineWidth',2.5);

end

xlabel('Dimensionless Radius, r/R_0');

ylabel('Dimensionless Temperature');

title(['Effect of ',parameterName,' on Temperature']);

legend(string(values),'Location','best');

grid on

saveFigure([parameterName '_Temperature']);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Concentration
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('Color','w');
hold on

for k=1:length(values)

    P = inputParameters();

    P = computeHybridProperties(P);

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

    end

    P = updateDerivedProperties(P);

    Result = solveSteadyModel(P);

    plot(Result.r,...
         Result.phi,...
         'Color',colors(k,:),...
         'LineWidth',2.5);

end

xlabel('Dimensionless Radius, r/R_0');

ylabel('Dimensionless Concentration');

title(['Effect of ',parameterName,' on Concentration']);

legend(string(values),'Location','best');

grid on

saveFigure([parameterName '_Concentration']);

end