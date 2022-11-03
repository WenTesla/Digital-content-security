%分别对含有秘密信息的载体图像进行攻击（缩放 resize、jpeg 压缩、低通滤波 filter2、中值滤波 medfilt2 等、剪切），计算其误码率。

z1=bitset(hd,1,g_b_x);
z2=imresize(z1,[100,100]);
t2=logical(bitget(z2,1));
t4=imresize(t2,[408,612]);
[number,ratio]=biterr(t4,x2);
disp(number);
disp(ratio);





