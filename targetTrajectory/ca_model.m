function [ state ] = ca_model( state,pos,acc )
%% constant acceleration motion model

if pos == 'x'
    state = [state(1:6);acc;state(8);state(9)];
elseif pos == 'y'
    state = [state(1:6);state(7);acc;state(9)];
elseif pos == 'z'
    state = [state(1:6);state(7);state(8);acc];
end


end

