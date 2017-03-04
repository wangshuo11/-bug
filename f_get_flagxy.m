function flagcellsxy=f_get_flagxy(I_stream,I_matlab)
I_gray=rgb2gray(I_stream);
I=bwlabel(I_matlab);
len=max(max(I(:,:)));
count_gray=zeros(len,255);
count_matlab =zeros(1,len);
flagcells=zeros(1,len);
for i=1:61
    for j=1:128
        if(I(i,j)>0)
            count_matlab(1,I(i,j))=count_matlab(1,I(i,j))+1;
            count_gray(I(i,j),I_gray(i,j))=count_gray(I(i,j),I_gray(i,j))+1;
        end
    end
end

for k=1:len
    [a,b]=max(count_gray(k,:));
     if(b~=233)
         if a/count_matlab(1,k)>0.5
             flagcells(1,k)=b;
         end
     end
end
% xy=f_getCxCy(I_matlab);
% flagcellsxy=[flagcells;xy];
end