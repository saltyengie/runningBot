function vars_base(vh)

  global step flags
  % State x
  vh.addState('xb');
  vh.addState('yb',  'lb',     0);
  vh.addState('thb', 'lb',  pi/4,'ub',         pi/2); % 腰角度
  if flags.use_wobbling_mass
    vh.addState('lw',  'lb',     0.3*params.l7,'ub',0.7*params.l7); % 揺動質量
  else
    vh.addState('lw',  'lb',     1/2*params.l7,'ub',1/2*params.l7); % 揺動質量
  end

  if flags.bird_leg
    vh.addState('th1', 'lb',  3/4*pi,'ub',       3/2*pi);
    vh.addState('th2', 'lb',    pi/4,'ub',       3/4*pi); % 膝角度
    vh.addState('th3', 'lb',       0,'ub',       3/4*pi); % 足首角度 
    vh.addState('th4', 'lb',  3/4*pi,'ub',       3/2*pi);
    vh.addState('th5', 'lb',    pi/4,'ub',       3/4*pi); % 膝角度
    vh.addState('th6', 'lb',       0,'ub',       3/4*pi); % 足首角度
  else
    vh.addState('th1', 'lb',  pi,'ub',     3/2*pi);
    vh.addState('th2', 'lb', -3/4*pi,'ub',            0); % 膝角度
    vh.addState('th3', 'lb',  pi/4,'ub',       3/4*pi); % 足首角度 
    vh.addState('th4', 'lb',  pi,'ub',     7/4*pi);
    vh.addState('th5', 'lb', -3/4*pi,'ub',          0); % 膝角度
    vh.addState('th6', 'lb',  pi/4,'ub',       3/4*pi); % 足首角度
  end

  if flags.use_sea
    vh.addState('phi1');
    vh.addState('phi2');
    vh.addState('phi3');
    vh.addState('phi4');
    vh.addState('phi5');
    vh.addState('phi6');
  else
    vh.addState('phi1', 'lb', 0,'ub', 0);
    vh.addState('phi2', 'lb', 0,'ub', 0);
    vh.addState('phi3', 'lb', 0,'ub', 0);
    vh.addState('phi4', 'lb', 0,'ub', 0);
    vh.addState('phi5', 'lb', 0,'ub', 0);
    vh.addState('phi6', 'lb', 0,'ub', 0);
  end    
  % diff
  vh.addState('dxb');
  vh.addState('dyb');
  vh.addState('dthb');
  if flags.use_wobbling_mass
    vh.addState('dlw');
  else
    vh.addState('dlw',  'lb',     0,'ub',0);
  end
  vh.addState('dth1');
  vh.addState('dth2');
  vh.addState('dth3');
  vh.addState('dth4');
  vh.addState('dth5');
  vh.addState('dth6');
  vh.addState('dphi1', 'lb',-20, 'ub',20);
  vh.addState('dphi2', 'lb',-20, 'ub',20);
  vh.addState('dphi3', 'lb',-20, 'ub',20);
  vh.addState('dphi4', 'lb',-20, 'ub',20);
  vh.addState('dphi5', 'lb',-20, 'ub',20);
  vh.addState('dphi6', 'lb',-20, 'ub',20);
  % time
  vh.addState('time'  ,'lb',0);
  % params
  if flags.optimize_k
    vh.addState('khip'  ,'lb',0, 'ub',1200);
    vh.addState('kknee' ,'lb',0, 'ub',2000);
    vh.addState('kankle','lb',0, 'ub',2000);
    %vh.addState('bankle','lb',0);
  end
  if flags.optimize_mw
    vh.addState('mw'    ,'lb', 0.1, 'ub', 0.2);
  end
  if flags.use_inerter
    vh.addState('beta_ankle' ,'lb',0,'ub', 0.5);
    vh.addState('beta_knee','lb',0,'ub', 0.5);
  end

  %  Algebraic Variable z
  vh.addAlgVar('ddxb');
  vh.addAlgVar('ddyb');
  vh.addAlgVar('ddthb');
  vh.addAlgVar('ddlw');
  vh.addAlgVar('ddth1');
  vh.addAlgVar('ddth2');
  vh.addAlgVar('ddth3');
  vh.addAlgVar('ddth4');
  vh.addAlgVar('ddth5');
  vh.addAlgVar('ddth6');
  vh.addAlgVar('ddphi1');
  vh.addAlgVar('ddphi2');
  vh.addAlgVar('ddphi3');
  vh.addAlgVar('ddphi4');
  vh.addAlgVar('ddphi5');
  vh.addAlgVar('ddphi6');


  % Control u
  if flags.optimize_vmode 
    % vh.addControl('u1','lb',-50,'ub',50); % dynamixel PH54-200-S500-R
    % vh.addControl('u2','lb',-50,'ub',50);
    % vh.addControl('u3','lb', -30,'ub', 30);
    % vh.addControl('u4','lb',-50,'ub',50);
    % vh.addControl('u5','lb',-50,'ub',50);
    % vh.addControl('u6','lb', -30,'ub', 30);
    vh.addControl('u1','lb',-300,'ub',300);
    vh.addControl('u2','lb',-200,'ub',200);
    vh.addControl('u3','lb', -10,'ub', 10);
    vh.addControl('u4','lb',-300,'ub',300);
    vh.addControl('u5','lb',-200,'ub',200);
    vh.addControl('u6','lb', -10,'ub', 10);
  else
    vh.addControl('u1','lb',-300,'ub',300);
    vh.addControl('u2','lb',-200,'ub',200);
    vh.addControl('u3','lb', -10,'ub', 10);
    vh.addControl('u4','lb',-300,'ub',300);
    vh.addControl('u5','lb',-200,'ub',200);
    vh.addControl('u6','lb', -10,'ub', 10);
  end
  
  if flags.use_wobbling_mass
    vh.addControl('uw','lb',-100,'ub',100);
  else
    vh.addControl('uw','lb',0,'ub',0);
  end
  % Parameter p
  vh.addParameter('p3', 'default', step);

end