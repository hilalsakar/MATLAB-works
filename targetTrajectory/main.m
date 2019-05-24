clear all; clear; clc

initiatorVal;

%% 
for i=1:2000
    prevTime = T;
    T = T + 0.1;
    
    if  (i <= 400)
        state = find_state_cv(stateRes,T,prevTime);
        stateRes = state;
    elseif (i <= 800)
        acc = [8;2;4];
        state = find_state_ca(stateRes,T,prevTime,acc);
        stateRes = state;
    elseif (i <= 1200)
        state = find_state_cv(stateRes(1:6),T,prevTime);
        stateRes = state;
    elseif (i <= 1600)
        acc = [-8;-2;-4];
        state = find_state_ca(stateRes,T,prevTime,acc);
        stateRes = state;
    elseif (i <= 2000)
        angVel = 0.1;
        state = find_state_ct(stateRes,T,prevTime,acc,angVel);
        stateRes = state;
    end

    trajectory = [trajectory, [state(1:6);T]];
end

dataX = trajectory(1,:);
dataY = trajectory(2,:);
dataZ = trajectory(3,:);

figure(1)
plot3(dataX,dataY,dataZ,'g');
grid on
hold on
xlabel('xLabel');
ylabel('yLabel');
zlabel('zLabel');



