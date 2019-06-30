function [realState] = find_state_cv( targetPos,T, prevTime )
% constant velocity model
time = T - prevTime;
I = eye(3);
Z = zeros(3);

A = [I,I*time;Z,I];

realState = A*targetPos;

end