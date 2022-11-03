%% 实验一

%生成随机数
rand('state',0);
r=rand(512,512);
r=im2bw(r,0.5);
%读入灰度图像，并将其二值化:
rgb1 = imread('1.jpg');
i10=rgb2gray(rgb1);
%bw1=dither(i10);
bw1=im2bw(i10);
%水印图像与伪随机数调制
zzz=xor(bw1,r);
%解密
bw2=xor(zzz,r);
%显示图像
figure;
subplot(1,3,1);
imshow(bw1);
title('二值化的图像');
subplot(1,3,2);
imshow(zzz);
title('加密后的图像');
subplot(1,3,3);
imshow(bw2);
title('解密后的图像');

%% 该实验

% 读入灰度图像或者读入彩色图像，并将彩色图像转化为灰度图像

x=imread("cameraman.tif");
% x=rgb2gray(x);
% x=im2bw(x);
% 读入实验一中生成的加密后的二值水印图像。
% zzz
%更改二值水印图像大小，要求和载体图像大小一致
x=imresize(x,2);
%将二值水印图像(bw1)替换载体图像第 1 位平面（最低位；最不重要位），
%利用 bitset 函数。
z1=bitset(i10,1,x);
figure;
imshow(z1);
%提取
tl=bitget (z1, 1);
figure;
imshow(logical(tl));




