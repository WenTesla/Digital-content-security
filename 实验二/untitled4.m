clc
clear
close all
 
I=imread("lena.bmp");           %载体图片
I0=imread("lena.bmp");          %被嵌入图片
figure()
[h,w]=size(I);
subplot(3,3,1);
imshow(I);
title("原图");
II=zeros(h,w,8);
II0=zeros(h,w,8);
%% 将载体图片分成8个位平面，并显示
a=I;   %存储原始图像矩阵
for k=1:8
    II(:,:,k) = mod(a,2);%将图像灰度值分解为二进制串，然后取第k位
    a=idivide(int32(a),int32(2));
    subplot(3,3,k+1);
    imshow(II(:,:,k));
    tex=['第',num2str(k),'个位平面'];
    title(tex);
end
 
%% 制作水印图片
a=I0;
for k=1:8
    II0(:,:,k) = mod(a,2);%将图像灰度值分解为二进制串，然后取第k位
    a=idivide(int32(a),int32(2));
end
figure();
A=zeros(h,w);          %制作水印图片，可以嵌入1个位平面的、2个位平面的、3个位平面的
subplot(2,2,1);
imshow(I0);
title("原图");
for i=1:3
    P=A;
    P(:,:)=P(:,:)*2+II0(:,:,9-i);
    A=P;
    P=bitshift(P,8-i);
    subplot(2,2,i+1);
    imshow(P,[]);
    tex=['嵌入',num2str(i),'个位平面的水印图片'];
    title(tex);
end
 
 
%% 图片开始嵌入载体图片并显示载体图像
figure();
subplot(2,2,1)
imshow(I);
title("原图");
III=zeros(h,w,3);     %分别嵌入1bit/pixel、2bit/pixel、3bit/pixel后的伪装图片
for k=1:3
    II(:,:,k)=II0(:,:,9-k);   %替换后三位的数据
    for kk=8:-1:1
        III(:,:,k)=III(:,:,k)*2+II(:,:,kk);
    end
    subplot(2,2,k+1);
    imshow(III(:,:,k),[]);
    tex=['嵌入',num2str(k),'bit/pixel后的伪装图片'];
    title(tex);
end
imwrite(uint8(III(:,:,3)),'result.jpg');
 
%% 嵌入图片提取
figure();
III0=zeros(h,w,3);      %分别保存三个维度的替换后的水印图片(取前3位）
for i=1:3
    a=int32(III(:,:,i));
    subplot(3,2,2*(i-1)+1);
    imshow(a,[]);
    tex=['嵌入',num2str(i),'bit/pixel后的伪装图片'];
    title(tex);
    IIII=zeros(h,w);
    for k=1:i
        III0(:,:,k)=mod(a,2);%将图像灰度值分解为二进制串，然后取第k位
        a=idivide(int32(a),int32(2));
        IIII(:,:)=IIII(:,:)*2+III0(:,:,k);
    end
    IIII=bitshift(IIII,8-i);
    subplot(3,2,2*(i-1)+2);
    imshow(IIII,[]);
    tex=['嵌入',num2str(i),'bit/pixel后的秘密信息提取'];
    title(tex);
end