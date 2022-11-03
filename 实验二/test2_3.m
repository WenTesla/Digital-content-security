%分别计算含有秘密信息的载体图像的峰值信噪比（PSNR），分析信息隐藏 
%图像质量。

j=imread("2-2.jpg");
g=imread('ezjm.jpg');
% 直接调用psnr api
peaksnr=psnr(g,j);
disp(peaksnr);






