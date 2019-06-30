function [ realState ] = find_state_ct( targetPos,T, prevTime,  angVel )
% coordinated turn motion model
time = T - prevTime;
I = eye(3);
Z = zeros(3);

sinwt = sin(angVel*time);
coswt = cos(angVel*time);

F = [sinwt/angVel -(1-coswt)/angVel 0; (1-coswt)/angVel sinwt/angVel 0;0 0 1];
FF = [coswt -sinwt 0; sinwt coswt 0; 0 0 1];

A = [I,F;Z,FF];

realState = A*targetPos;

end

