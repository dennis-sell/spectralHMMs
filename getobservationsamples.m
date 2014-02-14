function [samples] = getobservationsamples(N, len, HMM)
% Generates N observation sequences of length len from the TRANS and EMIS
% matrices which are the transition and emission distributions for an HMM.

% N     - integer
% len   - integer
% HMM   - Special Hidden Markov Model for use in this code.

samples = zeros(N,len);
    for i=1:N
        [seq, states] = hmmgenerate(len, TRANS, EMIS);
        samples(i,:) = seq;
    end

end

