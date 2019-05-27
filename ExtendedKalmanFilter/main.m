clear all,clc
load('TruthTrajectory.mat') % from targetTrajectory Folder

time = trajectory(10,:);
state = [];

for i=1:size(trajectory,2)
    trajectorywithNoise(1:3,i) = trajectory(1:3,i) + (- 20 + rand*40) ; % random values are between -20 and +20
    trajectorywithNoise(4:6,i) = trajectory(4:6,i) + (- 1  + rand*2) ; % random values are between -1 and +1
    
    y = ExtendedKalmanFilter_3d(trajectorywithNoise(1:6,i),0.1);
    
    state = [state y];
end

figure(1)
plot3(trajectorywithNoise(1,:),trajectorywithNoise(2,:),trajectorywithNoise(3,:),'b',...
    state(1,:),state(2,:),state(3,:),'g');
grid on

% %% estimation control
% 
% figure(1)
% plot3(state(1,:),state(2,:),state(3,:),'g',...
%     trajectory(1,:),trajectory(2,:),trajectory(3,:),'b--')
% grid on
% 
% figure(2)
% subplot(3,1,1)
% plot(state(1,:)-trajectory(1,:))
% grid on
% 
% subplot(3,1,2)
% plot(state(2,:)-trajectory(2,:))
% grid on
% 
% subplot(3,1,3)
% plot(state(3,:)-trajectory(3,:))
% grid on
