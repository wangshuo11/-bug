function cell_flagxy=f_get_flagxy_order
for picture_i=1:30
    str0='G:\\matlab\\bin\\test_distances_res_dilate_6_6_15_continuous\\ppm\\';
    str='000';
    str=strcat(str0,str);
    if picture_i<10
        str=strcat(str,'0');
    end
    temp=int2str(picture_i);
    str=strcat(str,temp);
    name_stream=strcat(str,'.ppm');
    I_stream=imread(name_stream);
   
  str1='G:\\matlab\\bin\\test_distances_res_dilate_6_6_15_continuous\\png\\';
    name_matlab=strcat(temp,'.png');
    name_matlab=strcat(str1,name_matlab);
    I_matlab=imread(name_matlab);
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
xy=f_getCxCy(I_matlab);
flagcellsxy=[flagcells;xy];
 for ii=1:61
     for jj=1:128
         if(I_gray(ii,jj)==233)
             I_gray(ii,jj)=0;
         end
     end
 end
 I_bwlabel=bwlabel(I_gray);
 order_of_supervoxel=zeros(1,len);
 for jj=1:len
     Cx=roundn(xy(1,jj),0);
     Cy=roundn(xy(2,jj),0);
     value_bwlabel=I_bwlabel(Cx,Cy);
     order_of_supervoxel(1,jj)=value_bwlabel;
 end
 flagcellsxy=[flagcellsxy;order_of_supervoxel];
cell_flagxy(1,picture_i)={flagcellsxy};
end
end