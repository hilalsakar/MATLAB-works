T = 0;
prevTime = T;
trajectory = [];


%% start off with initiator
%            [   x   ;y;z;Vx ;Vy;Vz;ax;ay;az]
stateInit = [6378137;0;0;100;0 ;0 ;0 ;0 ;0 ];
stateRes = real_state(stateInit,T,prevTime);
trajectory = [trajectory, [stateRes;prevTime]];