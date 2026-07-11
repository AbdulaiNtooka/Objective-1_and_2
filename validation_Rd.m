%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% validation_Rd.m
%
% Effect of Radiation Parameter on Temperature
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
clear
close all

RdValues = [0.2 0.4 0.6];

figure('Color','w')
hold on
box on

colors = lines(length(RdValues));

for k = 1:length(RdValues)

    P = inputParameters();

    P = computeHybridProperties(P);

    P.Re = 4.0;
    P.Pr = 19.0;
    P.Ha = 0.4;
    P.Ec = 0.5;
    P.Sc = 1.0;
    P.Kr = 0.1;

    P.Rd = RdValues(k);

    Result = solveSteadyModel(P);

    plot(Result.r,...
         Result.theta,...
         'Color',colors(k,:),...
         'LineWidth',2.5);

end

formatFigure(...
'Dimensionless Radius, r/R_0',...
'Dimensionless Temperature, \theta',...
'Effect of Radiation Parameter on Temperature');

legend('Rd = 0.2',...
       'Rd = 0.4',...
       'Rd = 0.6',...
       'Location','northwest');

exportgraphics(gcf,...
fullfile('Figures','Validation_Rd.png'),...
'Resolution',600);