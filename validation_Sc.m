%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% validation_Sc.m
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
clear
close all

ScValues = [1.0 1.2 1.4];

figure('Color','w')
hold on
box on

colors = lines(length(ScValues));

for k=1:length(ScValues)

    P=inputParameters();

    P=computeHybridProperties(P);

    P.Re=4;
    P.Pr=19;
    P.Ha=0.4;
    P.Rd=0.2;
    P.Ec=0.5;
    P.Kr=0.1;

    P.Sc=ScValues(k);

    Result=solveSteadyModel(P);

    plot(Result.r,...
         Result.phi,...
         'Color',colors(k,:),...
         'LineWidth',2.5);

end

formatFigure(...
'Dimensionless Radius, r/R_0',...
'Dimensionless Concentration, \phi',...
'Effect of Schmidt Number on Concentration');

legend('Sc = 1.0',...
       'Sc = 1.2',...
       'Sc = 1.4',...
       'Location','northwest');

exportgraphics(gcf,...
fullfile('Figures','Validation_Sc.png'),...
'Resolution',600);