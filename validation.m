%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% validation_Ha.m
%
% Validation of the Steady Solver
%
% Effect of Hartmann Number (Ha) on Velocity
%
% Reference:
% Imoro et al. (2024)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
clear;
close all;

%% Hartmann Numbers

HaValues = [0.4 0.6 0.8];

%% Create Figure

figure('Color','w');
hold on;
box on;

colors = lines(length(HaValues));

%% Loop over Hartmann Numbers

for k = 1:length(HaValues)

    %% Read Parameters

    P = inputParameters();

    P = computeHybridProperties(P);

    %% Parameters used in Imoro et al. (2024)

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
         'LineWidth',2,...
         'Color',colors(k,:));

end

%% Figure Formatting

xlabel('Radius, r/R','FontSize',12);

ylabel('Velocity','FontSize',12);

title('Effect of Hartmann Number on Velocity','FontSize',13);

legend('Ha = 0.4',...
       'Ha = 0.6',...
       'Ha = 0.8',...
       'Location','southwest');

grid on;

set(gca,'FontSize',12);

%% --------------------------------------------------------
% Save Figure
%% --------------------------------------------------------

% Create Figures folder in the current project directory
figFolder = fullfile(pwd,'Figures');

if ~exist(figFolder,'dir')
    mkdir(figFolder);
end

% Save figure
exportgraphics(gcf,...
    fullfile(figFolder,'Validation_Ha.png'),...
    'Resolution',300);

fprintf('\n');
fprintf('Figure saved successfully.\n');
fprintf('Location: %s\n',figFolder);