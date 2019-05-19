function [realState] = real_state( targetInit,T, prevTime )

time = T - prevTime;
I = eye(3);
Z = zeros(3);
acc = time^2/2;

A = [I,I*time,I*acc;Z,I,I*time;Z,Z,I];

realState = A*targetInit;

end