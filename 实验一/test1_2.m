%% 数字水印
% 生成伪随机数
rand('state',0)
r=rand(512,512)
%将伪随机数二值化，建议设定阈值（0.5），将伪随机数转化为 0 和 1
abc=im2bw(r,0.5);
% 读入水印图像
% 读入灰度图像，并将其二值化
x=imread("1.jpg")
i10=rgb2gray(x);
% imshow(i10)
%  bw1=dither(i10);
bw1=im2bw(i10,0.5);
% bw1=graythresh(i10)
imshow(bw1)
% 水印图像与伪随机数调制
zzz=xor(bw1,abc)
subplot(1,2,1)
imshow(zzz)
imwrite(zzz,"ezjm.jpg")
title('加密后的图像')
% 加密后水印图像解密
bw2=xor(zzz,abc)
subplot(1,2,2)
imshow(bw2)
title('解密后的图像')


