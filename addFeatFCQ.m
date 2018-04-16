

function [FTot, Feats, allFeats] = addFeatFCQ(FTot, Feats, F, Corr, allFeats)


maxFCD = -10000000;
curFCD = 0;
ind = -1;
for i = 1:length(allFeats)
    featId = allFeats(i); 
    curFCD = F( featId ) + FTot;
    
    Redundancy = 0;
    for j = 1:length(Feats)
        Redundancy = Redundancy + Corr(featId, j);
    end
    
    if Redundancy
        curFCD = curFCD / Redundancy;
    end
    
    if curFCD > maxFCD
        selectedFeat = featId;
        maxFCD = curFCD;
        ind = i;
    end
end



allFeats(ind) = [];
Feats = [Feats selectedFeat];
FTot = FTot + F( selectedFeat );