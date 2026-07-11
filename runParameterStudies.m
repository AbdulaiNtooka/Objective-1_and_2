%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Chapter Four Simulations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
clear
close all

%% Velocity Studies

parameterStudy('Ha',[0.4 0.6 0.8],'velocity');

parameterStudy('beta',[0.5 1.0 2.0],'velocity');

%% Temperature Studies

parameterStudy('Rd',[0.2 0.4 0.6],'temperature');

parameterStudy('Ec',[0.5 1.0 1.5],'temperature');

%% Concentration Studies

parameterStudy('Sc',[1.0 1.2 1.4],'concentration');

parameterStudy('Kr',[0.1 0.2 0.3],'concentration');