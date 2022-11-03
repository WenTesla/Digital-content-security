%% 随机选择嵌入位进行 LSB 信息隐藏及提取
g=imread("1.jpg");
% 灰度化图像
hd=rgb2gray(g);
% 处理图像
xrs=reshape(hd,1,512,512);
% 二值化
g_b_x=im2bw(g);
subplot(1,2,1);
imshow(g_b_x);
title('二值化图像');

x2=imresize(g_b_x,[408,612]);
x2rs=reshape(x2,1,408*612);

l=rand(0,0);
r=rand(l,64*64);
i=1;
for j=l:4096
    if r(j)>0.5
        i=i+64;xrs(i)=x2rs(j);
    else
        i=i+54;xrs(i)=x2rs(j);
    end
end
x3=reshape(xrs,512,512);
subplot(1,2,2);
imshow(x3);
title('隐藏后的图像');



