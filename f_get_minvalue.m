function minvalue=f_get_minvalue(cell_c,cell_c_visit)
   [len_cell_c_a,len_cell_c_b]=size(cell_c);
   minvalue=0;
   for i=1:len_cell_c_b
       if(cell_c_visit(1,i)==0)
           if(minvalue==0)
               minvalue=i;
           else
               temp_cell=cell2mat(cell_c(1,i));
               minvalue_cell=cell2mat(cell_c(1,minvalue));
               if(temp_cell(1,1)<minvalue_cell(1,1))
                   minvalue=i;
               elseif(temp_cell(1,1)==minvalue_cell(1,1))
                   if(temp_cell(1,2)<minvalue_cell(1,2))
                       minvalue=i;
                   end
               end
           end
       end
   end
end