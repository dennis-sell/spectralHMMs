function [samples] = getobservationsamples(n, len, HMM)
% Generates N observation sequences of length len from the TRANS and EMIS
% matrices which are the transition and emission distributions for an HMM.

% n     - integer
% len   - integer
% HMM   - Special Hidden Markov Model for use in this code.

samples = zeros(n,len);
    for i=1:n
        [seq, ~] = hmmgenerate(len, HMM.usedTrans, HMM.usedEmis);
        samples(i,:) = seq;
    end

end

