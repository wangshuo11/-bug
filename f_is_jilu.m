function flag=f_is_jilu(res,temp_res,pos)
      flag=1;
      [len_res_a,len_res_b]=size(res);
      [len_temp_res_a,len_temp_res_b]=size(temp_res);
      for i=1:len_res_b
          if(i==pos)
              continue;
          end
          temp_source=cell2mat(res(1,i));
         [len_temp_source_a,len_temp_source_b]=size(temp_source);
         if(len_temp_source_a<=len_temp_res_a)
             continue;
         end
         for j=1:len_temp_source_a-len_temp_res_a+1
             if(flag==0)
                 break;
             end
             for k=1:len_temp_res_a
                 if(temp_res(k,1)~=temp_source(j+k-1,1) || temp_res(k,2)~=temp_source(j+k-1,2) )
                     break;
                 end
                 if(k==len_temp_res_a)
                     flag=0;
                     break;
                 end
             end
         end
      end
end