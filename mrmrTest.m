
clear all;

N = 353; % number of data
%% getting the data
load('load the features');
x = features;
load('load the labels');
scores = labels;
numClass = length(unique(scores));

%% If the data not normalized: normalization
totSumIdx = sum(x);
stdFeat = std(x);
x = bsxfun(@minus,x,mean(x));
totSumIdx = totSumIdx ~=0;
x = bsxfun(@rdivide,x(:,totSumIdx),stdFeat(totSumIdx));
%% NaN Cleaner
ind = size(x);
for p = 1:length(x)
   for k = 1:ind(1)
    nan = isnan(x(k,p));
    if nan == 1
       x(k,p) = 0;
    end
   end
end


numFeat = length(x); % length of the feature set.


[featFCD, featFCQ] = mrmrMultiClass(x, numFeat, numClass, labs, N);
