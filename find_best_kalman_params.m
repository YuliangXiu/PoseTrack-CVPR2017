
for id=1:5000
    seed = rand(3);
    p_noise = 10*seed(1);
    m_noise = 10*seed(2);
    thres = 2*seed(3);
    ap = pt_evaluateAP_rmpe(3, p_noise, m_noise, thres);
    if ap(end)>33
        fprintf('params: p_noise %g m_noise %g thres %g \n',p_noise,m_noise,thres);
        break;
    end
end