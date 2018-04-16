
function [Corr] = computeCorr(x, N, numClass, numFeat, labs)


Corr = zeros(numFeat, numFeat);

x = x';
for i = 1:numFeat
    for j = 1:numFeat
        Corr(i,j) = ( N*sum(x(i,:) .* x(j, :)) ...
            - (sum(x(i,:))) * (sum(x(j,:))) ) / ...
            sqrt( (N*sum(x(i,:).^2) - sum(x(i,:))^2) * ...
            (N*sum(x(j,:).^2) - sum(x(j,:))^2) );
    end
end