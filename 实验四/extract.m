%% 音频水印提取

y4=dct(y2)%对嵌入水印的图像矩阵 DCT;
y4=reshape(y4,1,m*n);
y3=reshape(y,1,m*n);
w1=(y4(1:4096)-y3(1:4096))/a;%加法法则
w1=reshape(w1,64,64);
figure;imshow(w1);title('提取出的水印');
%均方误差 MSE 和峰值信噪比 PSNR
D=sum(sum((x-y2).^2));
MSE = D / (m * n);
PSNR = 10*log10( (255^2) / MSE );