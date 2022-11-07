%% 图像嵌入
function [final_img] = encode(img1,img2)

% 忽略十进制的十位
% 142->140
img1 = idivide(img1,10) * 10;

%% 裁剪尺寸使其一致
[h,w]=size(img1);
img2=imresize(img2,[h,w]);
img2=img2 * (9/255);
% imtool(img2);

%% 图像相加
final_img =img1+img2;
