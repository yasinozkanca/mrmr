

function [featFCD, featFCQ] = mrmrMultiClass(x, numFeat, numClass, labs, N,FMultGer,FMultTur)

F = computeF(x, N, numClass, numFeat, labs);

Corr = computeCorr(x, N, numClass, numFeat, labs);


FTot = 0;
featFCD = [];
featFCQ = [];
allFeatsFCD = [1:numFeat];
allFeatsFCQ = [1:numFeat];

for i = 1:numFeat
    %[FTot, featFCQ, allFeatsFCQ] = addFeatFCQ(FTot, featFCQ, F, Corr, allFeatsFCQ);
    [FTot, featFCD, allFeatsFCD] = addFeatFCD(FTot, featFCD, F, Corr, allFeatsFCD);    
end

%featFCQ
featFCD
