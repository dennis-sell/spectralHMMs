function [SpectralModel] = computespectralmodel(samples, observationRange, nStates)
% Creates the necessary matrices and vectors for easy analysis of
% observation probability, as explained in HKZ

n = observationRange;
m = nStates;
N = size(samples, 1);


% Calculate Probabilities of uni-, bi-, and tri-grams.

P1 = zeros(n, 1);
P2 = zeros(n, n);
P3 = zeros(n, n, n);

for i=1:size(samples,1)
    obs1 = samples(i,1);
    obs2 = samples(i,2);
    obs3 = samples(i,3);
    P1(obs1) = P1(obs1) + 1;
    %{
    Do we increment P1 by all three observations?
    P1(obs2) = P1(obs2) + 1;
    P1(obs3) = P1(obs3) + 1;
    P2(obs2, obs3) = P2(obs2, obs3) + 1;
    %}
    P2(obs1, obs2) = P2(obs1, obs2) + 1;
    P3(obs1, obs3, obs2) = P3(obs1, obs3, obs2) + 1;
end


P1 = P1 ./ N;
P2 = P2 ./ N;
P3 = P3 ./ N;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Creates b1, b_inf, and B_x's. Places into a spectral model.
[U, S, V] = svds(P2, m);

b1 = U'*P1;
b_inf = pinv(P2'*U) * P1;
for i=1:n
    B(:,:,i) = U' * P3(:,:,i) * pinv(U'*P2);
end

SpectralModel.b1 = b1;
SpectralModel.b_inf = b_inf;
SpectralModel.B = B;
SpectralModel.observationRange = observationRange;
