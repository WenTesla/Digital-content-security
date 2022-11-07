
img1 = imread('3.png');
img2 = imread('2.png');

subplot(2,3,1);
imshow(img1);
title('载体');

subplot(2,3,2);
imshow(img2);
title('隐藏');
% 提取rgb的三层矩阵
img1_r = img1(:,:,1);
img1_g = img1(:,:,2);
img1_b = img1(:,:,3);

img2_r = img2(:,:,1);
img2_g = img2(:,:,2);
img2_b = img2(:,:,3);
% 对三层矩阵进行处理
final_img_r=encode(img1_r,img2_r);
final_img_g=encode(img1_g,img2_g);
final_img_b=encode(img1_b,img2_b);
% 合成图像
final_img= cat(3,final_img_r,final_img_g,final_img_b);
imwrite(final_img,"output.png");
subplot(2,3,3);
imshow(final_img);
title('隐藏后');
% img1 = rgb2gray(img1);
% img2 = rgb2gray(img2);
% 
% final_img=encode(img1,img2);
% imshow(final_img);
