%% 立脚期(最初)のgridconstraints

function gridconstraints3(conh, k, K, x, p)
  tic;
  global q0 phi0 dq0 dphi0 
  global ppphi pphi
  global flags

  %% 共通部分
  [q, dq, phi, dphi] = utils.decompose_state(x);
  pj = SEA_model.pj(params,x);
  dpj = SEA_model.dpj(params,x);
  optimizer.gridconstraints_base(conh, q, phi, pj, dpj, x);

  %% 各関節が地面より上(y座標制約)
  conh.add(pj(1,2),'>=',0); % 支持脚ひざ
  conh.add(pj(3,2),'==',0); % 支持脚つまさき
  conh.add(pj(4,2),'>=',0);  % 支持脚かかと


  conh.add(pj(5,2),'>=',0);
%   if(k==1)                  % かかとは初期空中
%     conh.add(pj(6,2),'>=',0.1);
%     conh.add(pj(6,2),'<=',0.3);
%     conh.add(pj(4,2),'>=',0.05);
%   else
%     conh.add(pj(7,2),'>=',0);   % つまさきは地面以上
%   end
  conh.add(pj(7,2),'>=',0);
  conh.add(pj(8,2),'>=',0); % 遊脚かかと
  
  %% 遊脚前進制約
  conh.add(dpj(6,1),'>=',0);
    if k == K
        conh.add(dpj(2,2),'<=',0); %脚交換制約
        % Impact condition is in transition function
    end
  
    if k == 1
      conh.add(dpj(6,2),'>=',0); %脚交換制約
      q0 = q;
      phi0 = phi;
      dq0 = dq;
      dphi0 = dphi;
    end

    
  
  ppphi = pphi;
  pphi = phi;
    
  fprintf('gridconstraints3(k=%2d) complete : %.2f seconds\n',k,toc);
end
