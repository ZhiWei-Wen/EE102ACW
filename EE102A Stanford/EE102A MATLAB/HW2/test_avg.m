clear all; close all;

vec_len = 10;
num_tests = 10;
success = 0;

for n = 1:num_tests
    test = 10 *rand(vec_len,1);
    mu_matlab = mean(test);
    mu_mine = avg(test);

    if(mu_matlab==mu_mine)
        success = success + 1;
    end
end
if(success == num_tests)
    disp('Victory!');
else
    disp('Oops,try again!');
end

