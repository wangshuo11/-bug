close all;
clear all;
clc;
warning off;
for i=1:1:30
    str='E:\\anal1-30_dat\\';
    temp=int2str(i);
    str=strcat(str,temp);
    str=strcat(str,'.dat');
    str
    fid = fopen(str, 'r');
    I0= fread(fid,7808,'float32' ); 
    I1=reshape(I0,128,61);
    I2=I1;
    fclose(fid);
    I2(I2<=5)=0;
    I2(I2>5)=1;
    [I3,num]=bwlabel(I2,8);
    I3=bwareaopen(I3,8,8);
    [I3,num]=bwlabel(I3,8);
    I3=I3';
    str2='E:\\anal1_30_dat_matlab_pictures_5\\';
    str2=strcat(str2,temp);
   str2= strcat(str2,'.png');
   str2
    imwrite(I3,str2);
end