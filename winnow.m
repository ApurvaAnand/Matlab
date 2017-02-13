
function [weights,errors] = winnow(data,labels)

%% Simulate the Winnow algorithm
% Inputs: data - an n by m matrix where n is the number of instances and m is the number of features
%         labels - a 1 by n vector containing the labels for the instances.
% Output: weights - a 1 by m vector of weights for each feature. large values mean more relevant
%         errors - a scalar indicating the total number of errors made by the classifier

weights = ones(1,size(data,2)); %1 by m
theta = size(data,2)/2; % this is the decision threshold.
errors = 0;
predict_label=zeros(1,size(data,1))
for i=1:size(data,1)
    %% IMPLEMENT THE WINNOW ALGORITHM HERE
    if sum(dot(data(i,:),weights))>theta
        predict_label(i)=1;
    else
        predict_label(i)=0;
    end
    if predict_label(i)==1 && labels(i)==0
        errors=errors+1;
        for j=1:size(data,2)
            if data(i,j)==1
                weights(i)=weights(i)/2;
            end
            if data(i,j)==0
                weights(i)=2*weights(i);
            end
        end
    end
    if predict_label(i)==0 && labels(i)==1
        errors=errors+1;
        for j=1:size(data,2)
            if data(i,j)==1
                weights(i)=2*weights(i);
            end
            if data(i,j)==0
                weights(i)=weights(i)/2;
            end
        end
    end
end


end