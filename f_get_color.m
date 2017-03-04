function value=f_get_color(i,j,new_cell_c)
     value=0;
    len_new=length(new_cell_c);
    for k=1:len_new
        temp_cell=cell2mat(new_cell_c(1,k));
        [len_temp_cell,b]=size(temp_cell);
        for kk=1:len_temp_cell
            if(temp_cell(kk,1)==i&&temp_cell(kk,2)==j)
                value=temp_cell(kk,3);
                break;
            end
        end
    end
end