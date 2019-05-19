function [ state ] = cv_model( state )
%% constant velocity motion model

state = [state(1:6);state(7:9)*0];

end

