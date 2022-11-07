% 4.误码率
% 攻击，选取上述实验生成的秘密信息载体bitset0
% 原始秘密信息为上述实验生成的

% bitset0=imread("output.bmp");
biset0=b2;
bitset1=imresize(bitset0,[32,32]);
bitset1=imresize(bitset1,[64,64]);
bitset1=bitget(bitset1,1);
zzz=imread('ezjm.jpg');
% 计算误码率
count = 0;
for i=1:64*64
    if bitset1(i) == zzz(i)
        count = count + 1;
    end
end
WUMA = count/(64*64);
disp(WUMA);




