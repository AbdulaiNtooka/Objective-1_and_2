%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% validation_Ha.m
%
% Validation of the Steady MHD Solver
%
% Effect of Hartmann Number on the Velocity Profile
%
% Reference:
% Imoro et al. (2024)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
clear;
close all;

%% --------------------------------------------------------
% Hartmann Numbers
%% --------------------------------------------------------

HaValues = [0.4 0.6 0.8];

%% --------------------------------------------------------
% Create Figure
%% --------------------------------------------------------

figure('Color','w');

hold on;
box on;

colors = lines(length(HaValues));

%% --------------------------------------------------------
% Solve for Each Hartmann Number
%% --------------------------------------------------------

for k = 1:length(HaValues)

    %% Read Parameters

    P = inputParameters();

    P = computeHybridProperties(P);

    %% Parameters from Imoro et al. (2024)

    P.Re = 4.0;
    P.Pr = 19.0;
    P.Ec = 1.0;
    P.Rd = 0.2;
    P.Sc = 1.0;
    P.Kr = 0.1;

    %% Hartmann Number

    P.Ha = HaValues(k);

    %% Solve Model

    Result = solveSteadyModel(P);

    %% Plot Velocity

    plot(Result.r,...
         Result.u,...
         'LineWidth',2.5,...
         'Color',colors(k,:));

end

%% --------------------------------------------------------
% Figure Formatting
%% --------------------------------------------------------

xlabel('Dimensionless Radius, r/R_0',...
       'FontSize',14,...
       'FontWeight','bold');

ylabel('Dimensionless Velocity, u',...
       'FontSize',14,...
       'FontWeight','bold');

title('Effect of Hartmann Number on the Velocity Profile',...
      'FontSize',15,...
      'FontWeight','bold');

legend({'Ha = 0.4',...
        'Ha = 0.6',...
        'Ha = 0.8'},...
        'Location','southwest',...
        'FontSize',12);

grid on;
grid minor;

set(gca,...
    'FontSize',13,...
    'LineWidth',1.2,...
    'Box','on');

%% --------------------------------------------------------
% Create Figures Folder
%% --------------------------------------------------------

figFolder = fullfile(pwd,'Figures');

if ~exist(figFolder,'dir')
    mkdir(figFolder);
end

%% --------------------------------------------------------
% Save Figure (PNG)
%% --------------------------------------------------------

exportgraphics(gcf,...
    fullfile(figFolder,'Validation_Ha.png'),...
    'Resolution',600);

%% --------------------------------------------------------
% Save Figure (PDF Vector)
%% --------------------------------------------------------

exportgraphics(gcf,...
    fullfile(figFolder,'Validation_Ha.pdf'),...
    'ContentType','vector');

fprintf('\n');
fprintf('==============================================\n');
fprintf('Hartmann Number Validation Completed\n');
fprintf('==============================================\n');
fprintf('Figures saved to:\n%s\n',figFolder);
fprintf('==============================================\n');