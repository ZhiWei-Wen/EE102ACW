function x = x_ideal_rectpulsetrain(t,T0,T1)
% Returns ideal rectangular pulse train, with value of 1 inside each pulse,
% and value of 1/2 exactly at the boundaries of each pulse
x = double(abs(mod(t-T0/2,T0)-T0/2)<T1) + ...
    1/2*double(abs(mod(t-T0/2,T0)-T0/2)==T1);
end

