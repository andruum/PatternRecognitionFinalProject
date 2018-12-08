
gammagap = 0.01;

curgap = 0.06;

global maxgap
maxgap = curgap;

launch_train;
launch_validation;

res_validate_prev = res_validate_error;
prevgap = curgap;

nextgap = 0.05;

for i=1:100
    prevgap = curgap;
    curgap = nextgap;
    maxgap = curgap;
    maxgap
    launch_train;
    pause(2)
    launch_validation;
    if res_validate_error-res_validate_prev < 10e-7
        maxgap
        break;
    end
    nextgap = curgap - gammagap*(res_validate_error-res_validate_prev)/(curgap-prevgap);
    res_validate_prev = res_validate_error;
end