%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Chapter Four Generator
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
clear
close all

%% Hartmann Number

parameterStudy('Ha',...
    [0.4 0.6 0.8],...
    'velocity');

%% Radiation

parameterStudy('Rd',...
    [0.2 0.4 0.6],...
    'temperature');

%% Eckert

parameterStudy('Ec',...
    [0.5 1.0 1.5],...
    'temperature');

%% Schmidt

parameterStudy('Sc',...
    [1.0 1.2 1.4],...
    'concentration');

%% Chemical Reaction

parameterStudy('Kr',...
    [0.1 0.2 0.3],...
    'concentration');

%% Casson

parameterStudy('beta',...
    [0.5 1 2],...
    'velocity');