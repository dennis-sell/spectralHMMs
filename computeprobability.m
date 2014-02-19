function [ probability ] = computeprobability(sequence, spectralModel)
% Given a spectral hmm model, determines the probability that a series of
% observations would occur.

T = size(sequence, 2);

% observations - 1 x T matrix
% spectralModel - spectral model created by computespectralmodel

probability = spectralModel.b1;

for t = 1:T
    probability = spectralModel.B(:,:,sequence(t)) * probability;
end

probability = spectralModel.b_inf' * probability;
