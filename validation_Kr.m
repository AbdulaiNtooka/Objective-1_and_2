%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% validation_Kr.m
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
clear
close all

KrValues = [0.1 0.2 0.3];

figure('Color','w')
hold on
box on

colors = lines(length(KrValues));

for k=1:length(KrValues)

    P=inputParameters();

    P=computeHybridProperties(P);

    P.Re=4;
    P.Pr=19;
    P.Ha=0.4;
    P.Rd=0.2;
    P.Ec=0.5;
    P.Sc=1.0;

    P.Kr=KrValues(k);

    Result=solveSteadyModel(P);

    plot(Result.r,...
         Result.phi,...
         'Color',colors(k,:),...
         'LineWidth',2.5);

end

formatFigure(...
'Dimensionless Radius, r/R_0',...
'Dimensionless Concentration, \phi',...
'Effect of Chemical Reaction Parameter');

legend('Kr = 0.1',...
       'Kr = 0.2',...
       'Kr = 0.3',...
       'Location','northwest');

exportgraphics(gcf,...
fullfile('Figures','Validation_Kr.png'),...
'Resolution',600);