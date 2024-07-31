function v=objective_constitutive(D)

% this function simulates and plots the system for standard parameters
% the only input is drug concentration (sudden exposure at t=0)
% units of variables in uM, 100ug/ml Tc = 225uM

ka=10; % enzyme michaelis constant (uM)
Ka=50; % enzyme Vmax (1/min)
Kd=0.001; % dissociation repressor drug (uM)
Ki=0.015; % drug import rate (1/min)

A=0.008; % full expression of enzyme (uM/min), Philip: 0.008, ours: 0.05
R=0.0003; % full expression of repressor (uM/min), Philip: 0.0003, ours: 0.005
ra=0.0001; % repressor for half-repression of enzyme (uM)
rr=0.000075; % repressor for half-repression of repressor (uM)
na=5; % enzyme Hill coefficient
nr=3; % repressor Hill coefficient

phic=0.48; % partition, universal
rho=0.76; % partition, universal
k0t=0.075; % max. translational capacity (1/min), for E. coli
% k0n=0.12; % max. nutritional capacity (1/min), fit to L0=0.029
% L0=0.029; % max. growth (1/min), in uFlu trap with EZrich media
k0n=0.035; % max. nutritional capacity (1/min), varies with media, fit to L0=0.015
L0=0.015; % max. growth (1/min), in uFlu mmachine with M63 media
Kr=1; % drug conc. for half-repression of growth (uM)

df=@(d,r) (d-r-Kd+sqrt((d-r-Kd).^2+4*Kd*d))/2;
rf=@(d,r) (r-d-Kd+sqrt((r-d-Kd).^2+4*Kd*r))/2;

HA=@(d,r) A;
HR=@(d,r) 0;
DD=@(t) D*heaviside(t);

Kt=@(d,r) k0t*Kr./(Kr+df(d,r));

L=@(d,r) (phic/rho)*k0n*Kt(d,r)./(k0n+Kt(d,r));
f=@(d,r) (L(d,r)/L0).*(Kt(d,r)./(k0n+Kt(d,r)))/(k0t/(k0n+k0t));

function dx=equations(t,x)
    dx=zeros(3,1);
    dx(1)= f(x(3),x(1))*HR(x(3),x(1)) - L(x(3),x(1))*x(1);
    dx(2)= f(x(3),x(1))*HA(x(3),x(1)) - L(x(3),x(1))*x(2);
    dx(3)= Ki*(DD(t)-df(x(3),x(1))) - Ka*x(2)*df(x(3),x(1)) / (ka+df(x(3),x(1))) - L(x(3),x(1))*x(3);
end

r0=0;
a0=A/L0;

[tt,xx]=ode113(@(t,x) equations(t,x),[0 500],[r0,a0,0]);

v=[r0 a0 max(xx) xx(end,:) min(L(xx(:,3),xx(:,1))) L(xx(end,3),xx(end,1))];

end