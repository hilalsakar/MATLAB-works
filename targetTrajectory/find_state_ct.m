function [ realState ] = find_state_ct( targetPos,T, prevTime, acc, angVel )

time = T - prevTime;
I = eye(3);
Z = zeros(3);

sinwt = sin(angVel*time);
coswt = cos(angVel*time);

A = [I,I*((angVel^-1)*sinwt),I*((angVel^-2)*(1-coswt));
     Z,I*coswt                ,I*((angVel^-1)*sinwt)  ;
     Z,I*-angVel*sinwt        ,I*coswt];

if size(targetPos,1) == 6
    targetPos = [targetPos;acc(1);acc(2);acc(3)];
end

realState = A*targetPos;

end

