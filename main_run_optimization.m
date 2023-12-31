
close all;
clc;
clear;
global v step T flags

% ↓ optimization setting ↓
v = 8.0;  % desired velocity
step = 1.5;  % step (approximate)
period = step/v;
T = period;

flags = Flags;
flags.use_sea = true;
flags.use_wobbling_mass = true;
flags.optimize_mw = true;
flags.optimize_k = true;
flags.use_inerter = false; %aoyama's inerter at knee and ankle
flags.forefoot = false;  %forefoot running
flags.bird_leg = 0; %reversed knee
flags.optimize_vmode = 0;   %1/v become function instead of SR
flags.check()
% ↑ optimization setting ↑


ig = InitialGuess(step, false);
%ig.draw();


mode1 = ocl.Stage( ...
  [], ...
  'vars', @optimizer.vars1, ...
  'dae', @optimizer.dae1, ...
  'pathcosts', @optimizer.pathcosts, ...
  'gridconstraints', @optimizer.gridconstraints1, ...
  'N', 10, 'd', 3); % With support leg
mode2 = ocl.Stage( ...
  [], ...
  'vars', @optimizer.vars2, ...
  'dae', @optimizer.dae2, ...
  'pathcosts', @optimizer.pathcosts, ...
  'gridconstraints', @optimizer.gridconstraints2, ...
  'N', 14, 'd', 3); % Airborne 
% TODO Mode 3 Ground touch

%                        1end  
period_bound = period*[0.3, 0.6];
mode1.setInitialStateBounds('time', 0);
mode1.setEndStateBounds('time', period_bound(1), period_bound(2));
mode2.setInitialStateBounds('time', period_bound(1), period_bound(2));
mode2.setEndStateBounds('time', period*0.8, period*1.2);


ig.set_initial_guess(mode1, mode2, period);

ocp = ocl.MultiStageProblem({mode1,mode2}, ...
                            {@optimizer.trans_stand2float});

% save console log
exe_time = now;
[~,~]=mkdir('+console');
console_filename = ['+console/' datestr(exe_time,'yyyy-mm-dd_HH-MM-SS') '.log'];
diary(console_filename)

% solve
[sol,times, sol_info] = ocp.solve();

result = output.Result(sol, times, flags, sol_info);

% save results to file
[~,~]=mkdir('+results');
result_filename = [datestr(exe_time,'yyyy-mm-dd_HH-MM-SS') '.mat'];
save(['+results/' result_filename],'sol','times','result','flags','v','step');

diary off;
    
data_name = [datestr(exe_time,'yyyy-mm-dd_HH-MM-SS')];
output.result_txt(result,data_name);