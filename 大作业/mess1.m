% 算法1.把图像的数据重塑成一维的形式，对其进行置乱；
clear 
close   
clc  
G=imread('1.jpg');  
G=rgb2gray(G)
subplot(1,3,1);  
imshow(G);   
title('原图');  
A=G(:);    
A1=G(end: -1:1);%乱 
subplot(1,3,2); 
A1=reshape(A1,512,512)
% A1=imresize(A,0.5);
imshow(A1);  
title('一维置乱');  %title一下 
A2=A1(end:-1:1); 
A2G=reshape(A2,512,512); 
subplot(1,3,3) ;
imshow(A2G)   
title('置乱恢复');  %title一下
