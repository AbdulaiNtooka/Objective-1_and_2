function parameterStudy(parameter,values,field)

figure('Color','w')

hold on

colors = lines(length(values));

for k=1:length(values)

    P=inputParameters();

    P=computeHybridProperties(P);

    switch lower(parameter)

        case 'ha'
            P.Ha=values(k);

        case 'beta'
            P.beta=values(k);

        case 'rd'
            P.Rd=values(k);

        case 'ec'
            P.Ec=values(k);

        case 'sc'
            P.Sc=values(k);

        case 'kr'
            P.Kr=values(k);

    end

    Result=solveSteadyModel(P);

    switch lower(field)

        case 'velocity'

            plot(Result.r,...
                Result.u,...
                'Color',colors(k,:),...
                'LineWidth',2.5)

        case 'temperature'

            plot(Result.r,...
                Result.theta,...
                'Color',colors(k,:),...
                'LineWidth',2.5)

        case 'concentration'

            plot(Result.r,...
                Result.phi,...
                'Color',colors(k,:),...
                'LineWidth',2.5)

    end

end

xlabel('Dimensionless Radius, r/R_0')

ylabel(field)

title(['Effect of ',parameter])

legend(string(values),...
       'Location','best')

grid on

set(gca,'FontSize',12)

end