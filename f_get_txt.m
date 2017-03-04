function res=f_get_txt(path)
wholepath=strcat(path,'*.txt');
A = dir(wholepath);
A = struct2cell(A);
num = size(A);

for k =1:num(2)
    temp=A(1,k);
    x(k) = temp(1,1);   % ’“≥ˆname–Ú¡–
end

for k = 1:num(2)
    newpath =strcat(path,x(k));
    data{k} = load(char(newpath));
end

[a,b]=size(data);
for k=1:b
    temp_data=cell2mat(data(1,k));
    [ta,tb]=size(temp_data);
    tt=floor(ta/2);
    temp_con=zeros(tt,2);
    for i=1:ta
        if mod(i,2)==0
            temp_con(i/2,2)=temp_data(i,1);
        else
            temp_con(floor(i/2)+1,1)=temp_data(i,1);
        end 
    end
  res(1,k)={temp_con};
end
end