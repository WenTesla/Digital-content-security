%% 基本LSB信息隐藏
% 读入灰度图像挥着读入彩色图像，并将彩色图像转换成灰度图像
so=imread("1.jpg");
% 转为灰度图像
gray=rgb2gray(so);
subplot(3,3,1);
imshow(so);
title('彩色');
subplot(3,3,2);
imshow(gray);
title('灰度');
% 读入实验一生成的加密后的二值水印图像
e=imread('ezjm.jpg');
subplot(3,3,3);
imshow(e);
title('实验一');
% 更改二值水印图像的大小，要求与载体图像大小一致

% 将二值水印图像替换载体图像第 1 位平面（最低位；最不重要位），
% 利用 bitset 函数。
b1=bitset(gray,1,e);
subplot(3,3,4);
imshow(b1);
title('隐藏的图片');

%% 基本 LSB 信息提取

% 利用 bitget 函数，提含有秘密图像的载体图像最低位，得到加密后的
% 二值水印图像。

b2=bitget(b1,1);
subplot(3,3,5);
imshow(b2);
title('加密后的二值水印');
% 对二值图像解密后得到原始水印图像。
rand('state',0);
r=rand(512,512);
x=im2bw(r,0.5);
w=xor(b2,x);
subplot(3,3,6);
imshow(w);
title('解密后的');