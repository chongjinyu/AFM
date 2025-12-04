
file=dir('C:\Users\Jinyu0629\Desktop\Try\*.txt');             %文件夹路径，*.txt表示读取文件夹下的.txt文件
for n=1:length(file)                              %循环读取的次数
    temp=importdata(['C:\Users\Jinyu0629\Desktop\Try\',file(n).name]); %读取文件
    temp=temp(:,1);                                     %取第二列???
    A(:,n)=temp;         %赋值
    B={A.data};
          
         %eval([file(n).name,'=temp']);                     #将字符串转换为matlab可执行语句
end

          for j=1:1024
              X=B{1,j};
              a =X(:,3); b =X(:,1);
              xposition= find(b==min(b),1);    %值找到了，接着要把它存入到数组Data中
              Data(j)=a(xposition);  %这个值之前还只是，第几个数据，要对应到这个数据的x值.
              
              hold on;
              plot(a,b,'color',[rand(),rand(),rand()])
              axis tight; xlabel('Height sensor (nm)')
              hold off;
          end
    
        
        y=reshape(Data,32,32); %将Data这个1024拆分成32*32，再变为图
        surf(y);
        colormap(hot);
        xlabel('x axis');ylabel('y axis');
        zlabel('Height(nm)')
        axis tight;
        set(gca,'xtick',[0 32./2 32],'ytick',[0 32./2 32]);
        set(gca,'xticklabel',[0 1 2]);
        set(gca,'yticklabel',[0 1 2]);
        
        
          
          
          
        
          