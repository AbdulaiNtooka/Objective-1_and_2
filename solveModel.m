function Result = solveModel(P)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SOLVES THE COMPLETE MHD CASSON HYBRID NANOFLUID MODEL
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Grid

G = generateGrid(P);

%% Initial Conditions

F = initializeFields(P,G);

u     = F.u;
theta = F.theta;
phi   = F.phi;

%% Time Loop

for n = 1:G.Nt
fprintf('Time step %d of %d\n',n,G.Nt);
    u_old     = u;
    theta_old = theta;
    phi_old   = phi;

    for iter = 1:P.maxIter
        fprintf('   Iteration %d\n',iter);

        %% Momentum

        u = assembleMomentum(u,P,G);

        %% Pressure Correction

        %P = pressureCorrection(u,P,G);

        %% Energy

        theta = assembleEnergy(theta,u,P,G);

        %% Concentration

        phi = assembleConcentration(phi,P,G);

        %% Convergence

        err1 = max(abs(u-u_old));

        err2 = max(abs(theta-theta_old));

        err3 = max(abs(phi-phi_old));

        err = max([err1 err2 err3]);

        if err<P.tol

            break

        end
        fprintf('   Error = %.3e\n',err);
% Momentum
u = assembleMomentum(u,P,G);

fprintf('Time = %d, Iter = %d\n', n, iter);
fprintf('Velocity: min = %e, max = %e\n', min(u), max(u));

if any(isnan(u))
    error('NaN detected in velocity.');
end

% Energy
theta = assembleEnergy(theta,u,P,G);

fprintf('Temperature: min = %e, max = %e\n', min(theta), max(theta));

if any(isnan(theta))
    error('NaN detected in temperature.');
end

% Concentration
phi = assembleConcentration(phi,P,G);

fprintf('Concentration: min = %e, max = %e\n', min(phi), max(phi));

if any(isnan(phi))
    error('NaN detected in concentration.');
end
        u_old     = u;
        theta_old = theta;
        phi_old   = phi;

    end

end

%% Engineering Quantities

[Cf,Nu,Sh] = engineeringQuantities(u,theta,phi,P,G);

%% Store Results

Result.r = G.r;

Result.u = u;

Result.theta = theta;

Result.phi = phi;

Result.Cf = Cf;

Result.Nu = Nu;

Result.Sh = Sh;

end
