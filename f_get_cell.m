function translation_res=f_get_cell(path)
% res=f_get_txt('test_read_txt\\');
res=f_get_txt(path);
[len_res_a,len_res_b]=size(res);
count=1;
for i=1:len_res_b
    temp_res=cell2mat(res(1,i));
    flag=f_is_jilu(res,temp_res,i);
    if(flag)
        translation_res(1,count)={temp_res};
        count=count+1;
    end
end

