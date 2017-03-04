
close all;
clear all;
clc;
cell=f_get_flagxy_order;
len_cell=length(cell);
visit=zeros(len_cell,len_cell);

for i=1:29
   cell_i=cell2mat(cell(1,i));
   [a,len_cell_i]=size(cell_i);
    str=int2str(i);
    str=strcat(str,'_');
    for j=1:len_cell_i
        if( visit(i,j)==0)
         temp_str=int2str(j);
         savename1=strcat(str,temp_str);
         savename=strcat(savename1,'.txt');
         cell_j=cell_i(:,j);
          cell_next=cell2mat(cell(1,i+1));
            write_file(savename,i);
            write_file(savename,j);
           %¸ÄÎª·ÇµÝ¹é%
            flagxunhuan=1;
            start=i;
            cell_start=cell_i;
            pos=j;
       while(flagxunhuan)
             [a,len_cell_start]=size(cell_start);
             for kk=pos+1:len_cell_start
               if(visit(start,kk)==0)
                 if(cell_j(1,1)==cell_start(1,kk))
                     if(cell_j(4,1)==cell_start(4,kk))
                         visit(start,kk)=1;
                         write_file(savename,start);
                         write_file(savename,kk);
                     end
                 end
                 end
             end
               [pos,order_best]=f_get_continuous_cell(cell_j,cell_next,visit,start+1);
        if(pos~=0)
           if(start<29)
               write_file(savename,start+1);
                write_file(savename,pos);
            visit(start+1,pos)=1;
            cell_j=cell_next(:,pos);
            cell_next=cell2mat(cell(1,start+2));
            start=start+1;
             cell_start=cell2mat(cell(1,start));
            else
            flagxunhuan=0;
           end
        else
            flagxunhuan=0;
        end
     end
        end
    end
end