
%用于查找一个给定雨区的连续雨区，如果没哟，返回0%
function [pos,order_best]=f_get_continuous_cell(cell_j,cell_next,visit,start_next)
     [a,len_cell_next]=size(cell_next);
     flag=cell_j(1,1);
     pos=0;
     order_best=f_get_order_best(cell_j,cell_next,visit,start_next);
     if(order_best~=0)
         for cell_next_i=1:len_cell_next
             if(flag==cell_next(1,cell_next_i))
                 if(order_best==cell_next(4,cell_next_i))
                    pos=cell_next_i;
                    break;
                 end
             end
         end
     end
end