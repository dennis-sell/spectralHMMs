function [HMM] = makehmm(p, trans, emis)
    HMM.p = p;
    HMM.trans = trans;
    HMM.emis = emis;

    % Done to change the Initial State Distribution
    %    See:
    % http://www.mathworks.com/help/stats/hidden-markov-models-hmm.html
    HMM.usedTrans   = [0 p; zeros(size(trans,1),1) trans];
    HMM.usedEmis    = [zeros(1, size(emis, 2)); emis];
end
