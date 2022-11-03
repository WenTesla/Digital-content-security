horse=imread('2-1.jpg');
huihorse=rgb2gray(horse);
figure(1)
imshow(horse);
title('原来');
figure(2)
imshow(huihorse);
title('灰度');
% imshow(zz);%zz为实验一变量，这里已经引入到此文件夹，可忽略9-10行
% imwrite(zz,'jm.jpg');
e=imread('jm.jpg');
imshow(e);
%更改二值水印图片大小，与载体一致。
e=imresize(e,[198,198]);
imshow(e);
b1=bitset(huihorse,1,e);
imshow(b1);
b2=bitget(b1,1);
imshow(logical(b2));
imwrite(logical(b2),'mm.jpg');
rand('state',0);
rr=rand(198,198);
xx=im2bw(rr,0.5);
w=xor(b2,xx);
imshow(w);
title('解密');
%2、随机选择嵌入位进行 LSB 信息隐藏及提取
cg=imread('1-2.jpg');
huicg=rgb2gray(cg);
xrs=reshape(huicg,1,264*198);
gbx=im2bw(cg);
x2=imresize(gbx,[198,198]);
x2rs=reshape(x2,1,198*198);
l=rand(0,0);
r1=rand(l,64*64);
i=l;
for j=1;4096
    if r(j)>0.5
        i=i+64;xrs(i)=x2rs(j);
    else
        i=i+54;xrs(i)=x2rs(j);
    end
end
x3=reshape(xrs,264,198);
imshow(x3);
%分别计算含有秘密信息的载体图像的峰值信噪比（PSNR），分析信息隐藏 
%图像质量。原为jm.jpg,秘密信息为mm.jpg.
X=imread('jm.jpg');
Y=imread('mm.jpg');
XX=imresize(X,[198,198]);
X1=double(XX);
Y1=double(Y);
%实验一设置的五级灰度
B=5;
MAX=2^B-1;
MES=sum(sum((X1-Y1).^2))/(198*198);%均方差
PSNR=20*log10(MAX/sqrt(MES));

%分别对含有秘密信息的载体图像进行攻击
z1=bitset(huicg,1,gbx);
z2=imresize(z1,[100,100]);
t2=logical(bitget(z2,1));
t4=imresize(t2,[198,198]);
[number,ratio]=biterr(t4,x2);
number
ratio