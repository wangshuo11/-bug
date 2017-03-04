function f_digui(cell_j,cell_next,i,j,cell,savename,visit)
             write_file(savename,i);
             write_file(savename,j);
             [pos,order_best]=f_get_continuous_cell(cell_j,cell_next,visit,i+1);
             cell_i=cell2mat(cell(1,i));
             [a,len_cell_i]=size(cell_i)
             for kk=j+1:len_cell_i
                 if(cell_j(1,1)==cell_i(1,kk))
                     if(cell_j(4,1)==cell_i(4,kk))
                         write_file(savename,i);
                         write_file(savename,kk);
                     end
                 end
             end
        if(pos~=0)
            if(i<29)
            visit(i+1,pos)=1;
            cell_j=cell_next(:,pos);
            cell_next=cell2mat(cell(1,i+2));
            f_digui(cell_j,cell_next,i+1,pos,cell,savename,visit);
            end
        end
end