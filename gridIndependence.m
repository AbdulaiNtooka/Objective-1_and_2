clc
clear
close all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Grid Independence Study
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Nr = [21 41 81 161 321];

Error = zeros(length(Nr),1);

for k = 1:length(Nr)

    P = inputParameters();

    P = computeHybridProperties(P);

    P.Nr = Nr(k);

    P.beta = 1e6;

    P.Ha = 0;

    P.Rd = 0;

    P.Ec = 0;

    P.Kr = 0;

    P.rhoRatio = 1;
    P.muRatio = 1;
    P.kRatio = 1;
    P.cpRatio = 1;
    P.sigmaRatio = 1;

    Result = solveModel(P);

    uExact = 1 - Result.r.^2;

    Error(k) = max(abs(Result.u-uExact));

end

figure

loglog(Nr,Error,'o-','LineWidth',2)

xlabel('Number of Radial Nodes')

ylabel('Maximum Error')

title('Grid Independence Test')

grid on