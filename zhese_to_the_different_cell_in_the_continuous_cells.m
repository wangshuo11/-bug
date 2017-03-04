close all;
clear all;
clc;
 f_get_continunos_fidigui;
for i=1:30
    str0='G:\\matlab\\bin\\test_distances_res_dilate_6_6_25_continuous\\png\\';
    stri=int2str(i);
    stri=strcat(str0,stri);
    str=strcat(stri,'.png');
    I=imread(str);
    cell_I(1,i)={I};
end
cell_c=f_get_cell('G:\\matlab\\bin\\test_distances_res_dilate_6_6_25_continuous\\temp_continuous_cells\\');
len_c=length(cell_c);
cell_c_visit=zeros(1,len_c);
color_visit=zeros(1,6);

for i=1:len_c
    minvalue=f_get_minvalue(cell_c,cell_c_visit);
    cell_c_visit(1,minvalue)=1;
    temp_con=cell2mat(cell_c(1,minvalue));
    [len_con_a,len_con_b]=size(temp_con);
    [tt,mincolor]=min(color_visit);
    for j=1:6
        if(i~=mincolor)
            color_visit(1,j)=color_visit(1,j)-1;
        end
    end
    color_visit(1,mincolor)=len_con_b;
    new_temp_c=zeros(len_con_a,3);
    new_temp_c(:,1)=temp_con(:,1);
    new_temp_c(:,2)=temp_con(:,2);
    new_temp_c(:,3)=mincolor;
    new_cell_c(1,i)={new_temp_c};
end
for j=1:29
     img2=cell2mat(cell_I(1,j));
     [L,num] = bwlabel(img2,8);   
      if num~=0
      color_map=colormap(prism);
      [m,n] = size(img2);
      img_color = zeros(m,n,3);   % 显示图像，三通道；
      img_color_tmp =reshape(img_color,m*n,3);  % 拉成二维的，用于find函数，因为find找的是一维向量的下标；
      color_map=colormap(prism);    
       for i = 1:1:num
             res=f_get_color(j,i,new_cell_c)+1;
             img_color_tmp(find(L == i),1)= color_map(res,1);
             img_color_tmp(find(L == i),2)= color_map(res,2);
             img_color_tmp(find(L == i),3)= color_map(res,3);
              img_color =reshape(img_color_tmp, m, n, 3);
       end
            subplot(5,6,j);
            imshow(img_color);
      end
end
for j=1:30
     img2=cell2mat(cell_I(1,j));
     [L,num] = bwlabel(img2,8);   
      if num==0
         subplot(5,6,j);
         imshow(img2);
      end
end