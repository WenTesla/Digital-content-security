%% 水印嵌入

%水印嵌入
[x,fs]=audioread('坦克大战.mp3');%读入音频数据和采样率
[m,n]=size(x); %行列数
%DCT 一维变换
y=dct(x);
y1=reshape(y,1,m*n);%将矩阵 y 的元素返回到一个 1*mn 的矩阵
%取 64*64 的水印图像
w=imread('1.jpg');
w=rgb2gray(w);
w=im2double(w);
w=imresize(w,[64,64]);%变化尺寸
w1=reshape(w,1,64*64);%一维变换
%水印嵌入，加法法则
a=0.8;%水印强度
y1(1:4096)=y1(1:4096)+a*w1;
y2=reshape(y1,m,n);
y2=idct(y2);%逆 DCT
subplot(1,2,1);plot(x);title('原始音频');
subplot(1,2,2);plot(y2);title('嵌入水印音频');