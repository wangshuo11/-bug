function cell=f_get_all_flagxy
  
for picture_i=1:30
    str0='G:\\matlab\\bin\\test_distances_res_dilate_6_6_15_continuous\\ppm\\';
    str='000';
    str=strcat(str0,str);
    if picture_i<10
        str=strcat(str,'0');
    end
    temp=int2str(picture_i);
    str=strcat(str,temp);
    name_stream=strcat(str,'.ppm');
    I_stream=imread(name_stream);
   
  str1='G:\\matlab\\bin\\test_distances_res_dilate_6_6_15_continuous\\png\\';
    name_matlab=strcat(temp,'.png');
    name_matlab=strcat(str1,name_matlab);
    I_matlab=imread(name_matlab);
    flagcells=f_get_flagxy(I_stream,I_matlab);
    cell(1,picture_i)={flagcells};
end
end