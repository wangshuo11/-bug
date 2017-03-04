function order_best=f_get_order_best(cell_j,cell_next,visit,start_next)
   [a,len_cell_next]=size(cell_next);
   flag=cell_j(1,1);
     Xa=cell_j(2,1);
     Ya=cell_j(3,1);
  
     dis=0;
     order_best=0;
     for cell_next_i=1:len_cell_next
         if(flag==cell_next(1,cell_next_i)&&visit(start_next,cell_next_i)==0)
             if(dis==0)
                 Xb=cell_next(2,cell_next_i);
                 Yb=cell_next(3,cell_next_i);
                 tempdis=sqrt((Xa-Xb)*(Xa-Xb)+(Ya-Yb)*(Ya-Yb));
                 if(tempdis<35)
                 order_best=cell_next(4,cell_next_i);
                 dis=tempdis;
                 end
             end
             if(dis~=0)
                 Xc=cell_next(2,cell_next_i);
                 Yc=cell_next(3,cell_next_i);
                 temp_dis=sqrt((Xa-Xc)*(Xa-Xc)+(Ya-Yc)*(Ya-Yc));
                 if(dis>temp_dis)
                     dis=temp_dis;
                     order_best=cell_next(4,cell_next_i);
                 end
             end
         end
     end
end