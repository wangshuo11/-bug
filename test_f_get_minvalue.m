close all;
clear all
clc;
close all;
clear all;
clc;

cell_c=f_get_cell('C:\Program Files\MATLAB\R2016a\bin\test_distances_res_dilate_8_8_5_continuous');
len_c=length(cell_c);
cell_c_visit=zeros(1,len_c);
for i=1:len_c
    pos=f_get_minvalue(cell_c,cell_c_visit)
    cell_c_visit(1,pos)=1;
    array(1,i)=pos;
end
sort(array)
