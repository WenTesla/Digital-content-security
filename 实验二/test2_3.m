%分别计算含有秘密信息的载体图像的峰值信噪比（PSNR），分析信息隐藏 
%图像质量。

j=imread("output.bmp");
g=imread('lena.bmp');
% 直接调用psnr api
peaksnr=psnr(g,j);
%  peaksnr=psnr(b2,gray);
disp(peaksnr);






