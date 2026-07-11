%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% mainSteady.m
%
% Magnetohydrodynamic Flow of Chemically Reactive
% Casson Blood-Based Au-Fe Hybrid Nanofluid
% through a Diseased Artery
%
% Steady-State Finite Difference Solver
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
clear;
close all;

fprintf('\n');
fprintf('==============================================\n');
fprintf('   STEADY MHD CASSON HYBRID NANOFLUID SOLVER\n');
fprintf('==============================================\n');

%% --------------------------------------------------------
% Read Input Parameters
%% --------------------------------------------------------

P = inputParameters();

%% --------------------------------------------------------
% Compute Hybrid Nanofluid Properties
%% --------------------------------------------------------

P = computeHybridProperties(P);

%% --------------------------------------------------------
% Solve the Mathematical Model
%% --------------------------------------------------------

Result = solveSteadyModel(P);

%% --------------------------------------------------------
% Display Engineering Quantities
%% --------------------------------------------------------

fprintf('\n');
fprintf('Converged after %d iterations\n',Result.iter);

if isfield(Result,'Cf')
    fprintf('Skin Friction Coefficient : %12.6f\n',Result.Cf);
end

if isfield(Result,'Nu')
    fprintf('Nusselt Number            : %12.6f\n',Result.Nu);
end

if isfield(Result,'Sh')
    fprintf('Sherwood Number           : %12.6f\n',Result.Sh);
end

%% --------------------------------------------------------
% Plot Results
%% --------------------------------------------------------

plotResults(Result);

fprintf('\nSimulation Completed Successfully.\n');