clc;
clear;
%% kinetic model for Enzyme Kinetics
E_0 = 1;
S_0 = 10;
ES_0 = 0;
P_0 = 0;
xstate0 = [E_0, S_0, ES_0, P_0];

k_1 = 100;       % μM/min
k_1 = k_1/60;    % μM/s
k_2 = 600;       % μM/min
k_2 = k_2/60;    % μM/s
k_3 = 150;       % μM/min
k_3 = k_3/60;    % μM/s
param_0 = [k_1, k_2, k_3]';


a=0;                   % time start
b = 25;             % time end
h=1/1000;           % step size
y0 = xstate0';         % initial condition

ufunc = @(t,x) kinetic(t,x,param_0 );   % kinetic function
n=floor((b-a)/h);       % step
x(1)=a;                 % time start
y(:,1)=y0;              % initial condition

for i=1:n                % calculation loop 
    x(i+1)=x(i)+h;    
    k1=ufunc(x(i),y(:,i));  
    k2=ufunc(x(i)+h/2,y(:,i)+h*k1/2);    
    k3=ufunc(x(i)+h/2,y(:,i)+h*k2/2);   
    k4=ufunc(x(i)+h,y(:,i)+h*k3);   
    y(:,i+1)=y(:,i)+h*(k1+2*k2+2*k3+k4)/6; % main equation
end

%% plot result
% plot the change of E, S, ES, P 
subplot (2,1,1)
plot(repmat(x',[1,4]),y')
[E,S,ES,P] = disperse(y');
xlabel('time (s)');
ylabel('concentration (uM)');
legend({'E','S','ES','P'},'Location','East');
axis([0 10 0 12]);
hold on

% plot V & MAXV point
subplot (2,1,2)
rP  = (repmat(k_3,25001,1)).*ES;
plot(x',rP)
xlabel('time (s)');
ylabel('concentration (uM/s)');

hold on 
[rP_max, index] = max(rP);
A = [x',rP];
[m,n] = find(A==rP_max);
t_max = A(m,1);
plot(t_max,rP_max, 'ro')
legend('V','MAXV','Location','East');
axis([0 25 0 1.6]);
hold on 
hold off

