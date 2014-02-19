function [prob] = predictnextobservation( sequence, spectralModel)
% Given a model and the series of observations seen so far, will calculate the
% probabilities of seeing each possible observation next.

T = size(sequence,2);
b_inf = spectralModel.b_inf;

b_t = spectralModel.b1;
for t=2:(T+1)
   B_x = spectralModel.B(:,:,sequence(t-1));
   b_t = B_x * b_t / (b_inf' * B_x * b_t);
end

prob = zeros(1,spectralModel.observationRange);
for iObs = 1:spectralModel.observationRange
    prob(iObs) = b_inf' * spectralModel.B(:,:,iObs) * b_t;
end

prob = prob ./ sum(prob);

end

