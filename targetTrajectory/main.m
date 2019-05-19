clear all; clear; clc

initiatorVal;

for i=1:2000
    state = real_state(stateRes,T,prevTime);
    if  (i == 400)
        stateRes = ca_model( state,'x',8 );
        stateRes = ca_model( stateRes,'y',4 );
        stateRes = ca_model( stateRes,'z',8 );
    elseif (i == 800)
        stateRes = cv_model( state );
    elseif i == 1200
        stateRes = ca_model( state,'x',8 );
        stateRes = ca_model( stateRes,'y',-4 );
        stateRes = ca_model( stateRes,'z',8 );
    elseif i == 1600
        stateRes = [state(1:3);state(4:6);state(7:9)*1.5];
    else
        stateRes = state;
    end
    prevTime = T;
    T = T + 0.1;
    
    trajectory = [trajectory, [state;prevTime]];
end

dataX = trajectory(1,:);
dataY = trajectory(2,:);
dataZ = trajectory(3,:);

figure(1)
plot3(dataX,dataY,dataZ,'g');
xlabel('xLabel');
ylabel('yLabel');
zlabel('zLabel');



