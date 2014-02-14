function [SpectralModel] = computespectralmodel(samples, nObservations, nStates)
%SPECTRALMETHOD Summary of this function goes here
%   Detailed explanation goes here
N = nObservations;
M = nStates;


% Calculate Probabilities of uni-, bi-, and tri-grams.

P1 = zeros(N, 1);
P2 = zeros(N, N);
P3 = zeros(N, N, N);

for i=1:size(samples,1)
    obs1 = samples(i,1);
    obs2 = samples(i,2);
    obs3 = samples(i,3);
    P1(obs1) = P1(obs1) + 1;
    P2(obs1, obs2) = P2(obs1, obs2) + 1;
    P3(obs1, obs3, obs2) = P3(obs1, obs3, obs2) + 1;
end

P1 = P1 ./ sum(P1);
P2 = P2 ./ sum(sum(P2));
P3 = P3 ./ sum(sum(sum(P3)));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[U, S, V] = svd(P2);
U = U(:,1:M);

b1 = U'*P1;
b_inf = pinv(P2'*U) * P1;
for i=1:N
    B(:,:,i) = U' * P3(:,:,i) * pinv(U'*P2);
end

SpectralModel.b1 = b1;
SpectralModel.b_inf = b_inf;
SpectralModel.B = B;