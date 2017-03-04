function CxCy=f_getCxCy(I_matlab)
  I=bwlabel(I_matlab);
  num=max(max(I(:,:)));
  count=zeros(1,num);
  countCx=zeros(1,num);
  countCy=zeros(1,num);
  CxCy=zeros(2,num);
  for i=1:61
      for j=1:128
          if I(i,j)~=0
              countCx(1,I(i,j))=countCx(1,I(i,j))+i;
              countCy(1,I(i,j))=countCy(1,I(i,j))+j;
              count(1,I(i,j))=count(1,I(i,j))+1;
          end
      end
  end
  for k=1:num
      CxCy(1,k)=countCx(1,k)/count(1,k);
      CxCy(2,k)=countCy(1,k)/count(1,k);
  end
end