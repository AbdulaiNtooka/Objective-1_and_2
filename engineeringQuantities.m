function [Cf,Nu,Sh] = engineeringQuantities(u,theta,phi,P,G,varargin)

%======================================================================
%
% engineeringQuantities.m
%
% Computes
%
%   Skin Friction Coefficient
%   Nusselt Number
%   Sherwood Number
%
%======================================================================

verbose = false;

if nargin > 5
    verbose = varargin{1};
end

%% --------------------------------------------------------
% Wall Gradients
%% --------------------------------------------------------

dudr = gradientR(u,G.dr);

dTdr = gradientR(theta,G.dr);

dCdr = gradientR(phi,G.dr);

%% --------------------------------------------------------
% Engineering Quantities
%% --------------------------------------------------------

Cf = -dudr(end);

Nu = -dTdr(end);

Sh = -dCdr(end);

%% Remove numerical noise

tol = 1.0e-12;

if abs(Cf) < tol
    Cf = 0;
end

if abs(Nu) < tol
    Nu = 0;
end

if abs(Sh) < tol
    Sh = 0;
end

%% --------------------------------------------------------
% Optional diagnostics
%% --------------------------------------------------------

if verbose

    fprintf('\n');
    fprintf('----------------------------------------\n');
    fprintf('Wall Derivatives\n');
    fprintf('----------------------------------------\n');

    fprintf('du/dr = %12.6e\n',dudr(end));
    fprintf('dT/dr = %12.6e\n',dTdr(end));
    fprintf('dC/dr = %12.6e\n',dCdr(end));

    fprintf('\n');
    fprintf('Cf = %12.6f\n',Cf);
    fprintf('Nu = %12.6f\n',Nu);
    fprintf('Sh = %12.6f\n',Sh);

end

end