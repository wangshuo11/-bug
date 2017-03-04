close all;
clear all;
clc;
cell=f_get_all_flagxy;
len_cell=length(cell);
visit=zeros(len_cell,len_cell);
count=0;

for i=1:len_cell-1
   cell_i=cell2mat(cell(1,i));
   [a,len_cell_i]=size(cell_i);
    str=int2str(i);
    str=strcat(str,'_');
    for j=1:len_cell_i
        if visit(i,j)~=0
            disp(i);
            continue;
        end
        temp_str=int2str(j);
        savename1=strcat(str,temp_str);
        savename=strcat(savename1,'.txt');
        cell_j=cell_i(:,j);
%         for kk=j+1:len_cell_i
%             cell_kk=cell_i(:,kk);
%             if(cell_kk(1,1)==cell_j(1,1))
%                 cell()
%             end
%         end
        cell_next=cell2mat(cell(1,i+1));
        f_digui(cell_j,cell_next,i,j,cell,savename,visit,cell_i);
    end
end