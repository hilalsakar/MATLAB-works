function [ y ] = ExtendedKalmanFilter_3d( z,time )
persistent x_est p_est                % could give an input and output. But persistent is simple.
if isempty(x_est)
    x_est = zeros(9,1);             
    p_est = eye(9);
end

I = eye(3);
Z = zeros(3);

%% transition matrix
A = [I,I*time,I*(time^2/2);Z,I,I*time;Z,Z,I];

%% Measurement Matrix
H = [eye(3) zeros(3,6); zeros(3,6) eye(3)];

Q = eye(9);

%% Measurement noise covariance
R = diag([20 20 20 1 1 1]); 
% R = 1000 *eye(6);
%% Predicted state and covariance
x_prd = A * x_est;
p_prd = A * p_est * A' + Q;

%% Estimation
S = H * p_prd * H' + R;
kalman_gain = p_prd*H'*S^-1;


%% Estimated state and covariance
x_est = x_prd + kalman_gain * (z - H * x_prd);
p_est = (eye(9,9) - kalman_gain*H)*p_prd;

%% Compute the estimated measurements
y = H * x_est;

end                


