clear all; clear; clc

initiatorVal;

%% 
for i=1:2400
    prevTime = T;
    T = T + 0.1;
    
    if  (i <= 400)
        state = find_state_cv(stateRes,T,prevTime);
        stateRes = state;
    elseif (i <= 2400)
        angVel = deg2rad(0.1)/(T-prevTime);
        state = find_state_ct(stateRes,T,prevTime,angVel);
        stateRes = state;
    end
    trajectory = [trajectory, [state;T]];
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

save('truthTrajectory.mat','trajectory');



