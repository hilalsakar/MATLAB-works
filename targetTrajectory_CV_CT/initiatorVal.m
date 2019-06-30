T = 0;
prevTime = T;
trajectory = [];


%% start off with initiator 
% constant velocity motion model
%            [  x ;  y  ;  z  ; Vx ;  Vy ;Vz]
stateInit = [40000;20000;10000;-100;-200 ;0];
stateRes = find_state_cv(stateInit,T,prevTime);
trajectory = [trajectory, [stateRes;T]];

% constant acceleration motion model
%            [  x ;  y  ;  z  ; Vx ;  Vy ;Vz ; ax ; ay ; az ]