% 解函数
function [img1,img2] = decode(image)
    img1=idivide(image,10)*10;
    img2=image - img1;
    img2=img2*(255/9);
end
