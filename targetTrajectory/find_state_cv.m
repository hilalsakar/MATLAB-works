function [realState] = find_state_cv( targetPos,T, prevTime )

time = T - prevTime;
I = eye(3);
Z = zeros(3);

A = [I,I*time;Z,I];

if size(targetPos,1) == 9
    targetPos = targetPos(1:6);
end

realState = A*targetPos;

end