image = imread('output.png');
% imgae = final_img;

image_r=image(:,:,1);
image_g=image(:,:,2);
image_b=image(:,:,3);


[img1_r,img2_r] = decode(image_r);
[img1_g,img2_g] = decode(image_g);
[img1_b,img2_b] = decode(image_b);


img1 =cat(3,img1_r,img1_g,img1_b);
img2 =cat(3,img2_r,img2_g,img2_b);

subplot(2,3,4);
imshow(img2);
title('提取的信息')
% figure;
% imshow(img1);
% figure;
% imshow(img2);
