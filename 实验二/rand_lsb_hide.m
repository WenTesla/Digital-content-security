%2.随机选择嵌入位
function [ste_cover,len_total]=rand_lsb_hide(input,file,output,key)
%读入图像矩阵
cover=imread(input);
ste_cover=cover;
ste_cover=double(ste_cover);
%将文本文件转换为二进制
f_id=fopen(file,'r');
[msg,len_total]=fread(f_id,'ubit1');
%判断嵌入的信息量是否过大
[m,n]=size(ste_cover);
if len_total>m*n
  error('嵌入信息量过大，请重新选择图像');
end
ste_cover=uint8(ste_cover);
imwrite(ste_cover,output);
%显示实验结果
subplot(1,2,1);imshow(cover);title('原始图像');
subplot(1,2,2);imshow(output);title('隐藏信息的图像');