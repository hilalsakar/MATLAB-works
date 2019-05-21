function [realState] = find_state_ca( targetPos,T, prevTime,acc )

time = T - prevTime;
I = eye(3);
Z = zeros(3);

if size(targetPos,1) == 6
    targetPos = [targetPos;acc(1);acc(2);acc(3)];
end
A = [I,I*time,I*(time^2/2);Z,I,I*time;Z,Z,I];

realState = A*targetPos;

end