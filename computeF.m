
function [F] = computeF(x, N, numClass, numFeat, labs)

gBar = mean(x);
gkBar = zeros(numClass, numFeat);
nk = zeros(1, numClass);
sigmaK= zeros(numClass, numFeat);


for i = 1:numClass
    ind = find(labs == i);
 
    if isempty(ind)
        continue;
    end
    gkBar(i, :) = mean(x(ind,:));

    nk(i) = length(ind);
    
    sigmaK(i, :) =  var(x(ind, :));
end




F = zeros(numFeat, 1);
for i = 1:numFeat

    sigma = 0;
    for k = 1:numClass
       
        F(i) = F(i) + nk(k)*(gkBar(k, i) - gBar(i))^2 / ...
            (numClass - 1);
    
        sigma = sigma + sigmaK(k, i) * (nk(k) - 1);
    end
    
    sigma = sigma / (N - numClass);
    F(i) = F(i)/sigma;
end
