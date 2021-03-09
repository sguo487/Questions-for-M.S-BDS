function xdot = kinetic(t,xstate,param)
% equations of the kinetic simulations, [E,S,ES,P]_dot 

% Unpack the states: [X,P,S]   
[E,S,ES,P] = disperse(xstate); 


[k1,k2,k3] = disperse(param);

% Calculate the reaction rates ----------------------------------------- 
rE  = k2*ES + k3*ES - k1*S*E; 
rS  = k2*ES - k1*S*E;
rES = k1*S*E - k2*ES - k3*ES;
rP  = k3*ES;

xdot(1,1) = rE; % dE/dt 
xdot(2,1) = rS; % dS/dt 
xdot(3,1) = rES;% dES/dt 
xdot(4,1) = rP;% dP/dt 

end

