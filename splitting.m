clear all;
close all;
clc;

f= imread('input.png');
% figure,imshow(f);title('Input Image');
f= double(f);
%% Create a region image.
[R,C] = size(f);
regionIm = ones(R,C,'uint16');
processList = [1];
% visualize_sp(f,regionIm);

%% Threshold given.
Th = 20;

pointer = 1;
while(numel(processList) ~= 0 )
    label = processList(1);
    
    %% Compute Standard Deviation for the Region.
    [locationsRegion] = find(label== regionIm(:));
    h = std(f(locationsRegion(:)));
    if(h > Th)
        %% Split and Add the 4 Regions into the Process List.
        i = pointer;
        regionIm = splitImageIntoRegions(regionIm,pointer,label);
        j = length(processList);
        processList(j+1:j+4)=0;
        for p = j+1:j+4
            pointer = pointer +1;
            processList(p)= pointer;
        end
    end
%     visualize_sp(f,regionIm);
    processList = processList(2:end);
    
end

visualize_sp(f,regionIm);