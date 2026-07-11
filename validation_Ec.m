%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% validation_Ec.m
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
clear
close all

EcValues = [0.5 1.0 1.5];

figure('Color','w')
hold on
box on

colors = lines(length(EcValues));

for k=1:length(EcValues)

    P=inputParameters();

    P=computeHybridProperties(P);

    P.Re=4;
    P.Pr=19;
    P.Ha=0.4;
    P.Rd=0.2;
    P.Sc=1.0;
    P.Kr=0.1;

    P.Ec=EcValues(k);

    Result=solveSteadyModel(P);

    plot(Result.r,...
         Result.theta,...
         'Color',colors(k,:),...
         'LineWidth',2.5);

end

formatFigure(...
'Dimensionless Radius, r/R_0',...
'Dimensionless Temperature, \theta',...
'Effect of Eckert Number on Temperature');

legend('Ec = 0.5',...
       'Ec = 1.0',...
       'Ec = 1.5',...
       'Location','northwest');

exportgraphics(gcf,...
fullfile('Figures','Validation_Ec.png'),...
'Resolution',600);