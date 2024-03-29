function zmp(result)

if result.flags.runtype == 0
    t = result.algvars_time(1:result.algvars_size(1));
else
    t = result.algvars_time(result.algvars_size(1)+1:sum(result.algvars_size([1,2])));
end
figure;
title("zmp");
plot(t, result.zmp_x);
hold on;
plot(t, -params.c1*ones(length(t), 1), 'color', 'k');
plot(t, (params.l3-params.c1)*ones(length(t), 1), 'color', 'k');
xlabel('time [t]'); ylabel('zmp [m]');
ylim([-params.c1, (params.l3-params.c1)]*1.2);
legend("x");

end