% 算法2.把图像看成二维的形式，采用二维坐标的形式对其进行置乱；
clear 
close 
clc  
G=imread('1.jpg'); 
G=rgb2gray(G);
%缩小尺寸
G=imresize(G,0.5);
subplot(1,3,1); 
imshow(G);  
title('原图') %title一下原图
Gadd=fix(256*rand(256,256)); 
for i=1:256  
     for j=1:256  
        G1(i,j)=0.1*G(i,j)+0.9*Gadd(i,j);  
     end 
end  
subplot(1,3,2); 
imshow(G1); 
 title('置乱后的图像')  ;
for i=1:256   
       for j=1:256  
           G2(i,j)=(G1(i,j)-0.9*Gadd(i,j))./0.1;   
       end  
end  
subplot(1,3,3) 
imshow(G2); %显示图像
title('恢复后的图像');

