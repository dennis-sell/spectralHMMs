function [prob] = predictnextobservation( observationArray, spectralModel)
% Given a model and the series of observations seen so far, will calculate the
% probabilities of seeing each possible observation next.

T = size(observationArray,2);
b_inf = spectralModel.b_inf;

b_t = spectralModel.b1;
for t=2:(T+1)
   observation = observationArray(t-1);
   B_x = spectralModel.B(:,:,observation);
   b_t = B_x * b_t / (b_inf' * B_x * b_t);
end

prob = zeros(1,spectralModel.nObservations);
for iObs = 1:spectralModel.nObservations
    prob(iObs) = b_inf' * spectralModel.B(:,:,iObs) * b_t;
end

prob = prob ./ sum(prob);

end

