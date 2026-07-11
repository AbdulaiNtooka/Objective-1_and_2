%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Engineering Quantities
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
clear
close all

%% Hartmann Number

engineeringParameterStudy(...
'Ha',...
[0.4 0.6 0.8]);

%% Casson Parameter

engineeringParameterStudy(...
'beta',...
[0.5 1.0 2.0]);

%% Radiation Parameter

engineeringParameterStudy(...
'Rd',...
[0.2 0.4 0.6]);

%% Eckert Number

engineeringParameterStudy(...
'Ec',...
[0.5 1.0 1.5]);

%% Schmidt Number

engineeringParameterStudy(...
'Sc',...
[1.0 1.2 1.4]);

%% Chemical Reaction Parameter

engineeringParameterStudy(...
'Kr',...
[0.1 0.2 0.3]);

fprintf('\n');
fprintf('============================================\n');
fprintf('Engineering Quantity Study Completed\n');
fprintf('============================================\n');