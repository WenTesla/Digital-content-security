% https://blog.csdn.net/dollar_jen/article/details/115335268?spm=1001.2101.3001.6650.4&utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7ERate-4-115335268-blog-115381954.pc_relevant_3mothn_strategy_and_data_recovery&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7ERate-4-115335268-blog-115381954.pc_relevant_3mothn_strategy_and_data_recovery&utm_relevant_index=9
clc,clear;
P=imread('1.jpg');P=rgb2gray(P);% 读入图像 转化为灰度图像
iptsetpref('imshowborder','tight');% 设置图像显示无边框
figure(1);imshow(P);% 显示
[M,N]=size(P);P=double(P);% 获得图像行列数M N
n=M+N;% 设定计算的混沌序列长度
h=0.002;t=800;% 以下
a=10;b=8/3;c=28;r=-1;
x0=1.1;y0=2.2;z0=3.3;w0=4.4;
s=zeros(1,n);
for i=1:n+t
    K11=a*(y0-x0)+w0;K12=a*(y0-(x0+K11*h/2))+w0;
    K13=a*(y0-(x0+K12*h/2))+w0;K14=a*(y0-(x0+h*K13))+w0;
    x1=x0+(K11+K12+K13+K14)*h/6;
    
    K21=c*x1-y0-x1*z0;K22=c*x1-(y0+K21*h/2)-x1*z0;
    K23=c*x1-(y0+K22*h/2)-x1*z0;K24=c*x1-(y0+h*K23)-x1*z0;
    y1=y0+(K21+K22+K23+K24)*h/6;
    
    K31=x1*y1-b*z0;K32=x1*y1-b*(z0+K31*h/2);
    K33=x1*y1-b*(z0+K32*h/2);K34=x1*y1-b*(z0+h*K33);
    z1=z0+(K31+K32+K33+K34)*h/6;
    
    K41=-y1*z1+r*w0;K42=-y1*z1+r*(w0+K41*h/2);
    K43=-y1*z1+r*(w0+K42*h/2);K44=-y1*z1+r*(w0+h*K43);
    w1=w0+(K41+K42+K43+K44)*h/6;
    
    x0=x1;y0=y1;z0=z1;w0=w1;
    if i>t
        s(i-t)=x1;
        if mod((i-t),3000)==0% 每3000次迭代后加扰动
            x0=x0+h*sin(y0);
        end
    end
end% 以上 生成混沌序列
X=mod(floor((s(1:M)+100)*10^10),M)+1;% 生成行置乱向量
Y=mod(floor((s(M+1:M+N)+100)*10^10),N)+1;% 生成列置乱向量
A=P;
for i=1:M
    t=A(i,:);A(i,:)=A(X(i),:);A(X(i),:)=t;
end
figure(2);imshow(uint8(A));% 行置乱后的图像
B=A;
for j=1:N
    t=B(:,j);B(:,j)=B(:,Y(j));B(:,Y(j))=t;
end
figure(3);imshow(uint8(B));% 列置乱后的图像
