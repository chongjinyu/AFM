file=dir('C:\Users\Jinyu0629\Desktop\Try\*.txt');             %文件夹路径，*.txt表示读取文件夹下的.txt文件
for n=1:length(file)                              %循环读取的次数
    temp=importdata(['C:\Users\Jinyu0629\Desktop\Try\',file(n).name]); %读取文件
    temp=temp(:,1);                                     %取第二列???
    A(:,n)=temp;         %赋值
    B={A.data};
  
 end   
          
          for j=1:1024 
             X=B{1,j};         % a =X(:,3); 横坐标一栏
             b =X(:,1);
             row_num = find(b<0.001,1);
             value=X(row_num,3);
             Y{j}=value;  M=cell2mat(Y);            

          end
          

             

         
         
        

