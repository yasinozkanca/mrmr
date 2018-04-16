

function [FTot, Feats, allFeats] = addFeatFCD(FTot, Feats, F, Corr, allFeats)


maxFCD = -10000000;
curFCD = 0;
selectedFeat = -1;
ind = -1;
for i = 1:length(allFeats)
    featId = allFeats(i); 
    curFCD = F( featId ) + FTot;
    
    Redundancy = 0;
    for j = 1:length(Feats)
        Redundancy = Redundancy + Corr(featId, j);
    end
    
    curFCD = curFCD - (1/(length(Feats) + 1)) * Redundancy;
    
    if curFCD > maxFCD
        selectedFeat = featId;
        maxFCD = curFCD;
        ind = i;
    end
end

if selectedFeat == -1
    display 'No feature is selected'
end


allFeats(ind) = [];
Feats = [Feats selectedFeat];
FTot = FTot + F( selectedFeat );