function newregionIm = splitImageIntoRegions(regionIm,pointer,label)
    


[rows,cols] = find(regionIm == label);
r0= rows(1);
c0 = cols(1);
R = rows(end);
C = cols(end);
middleRow = floor((r0+R)/2);
middleCol = floor((c0+C)/2);

regionIm(r0:middleRow,c0:middleCol)= pointer+1;
regionIm(r0:middleRow, middleCol+1:C)=pointer+2;
regionIm(middleRow+1:R,c0:middleCol)= pointer+3;
regionIm(middleRow+1:R,middleCol+1:C)= pointer+4;    
    

newregionIm = regionIm;
end
