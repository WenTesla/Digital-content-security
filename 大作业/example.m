[filename,pathname]=uigetfile('*.bmp' , 'pick a secretive image file');
fn=[pathname filename];
inlmg=imread(fn);
iTimes=input('Please input Arnord scramble times[1]:');
if isempty(iTimes)
iTimes=1;
end
w=inlmg;M=w;
Size_w=size(w);
subplot(2,2,1);
imshow(w);
title('置乱前的秘密图像');
[c,d,e]=size(w);
w1=zeros(c,d,e);
Temp=zeros(c,d,e);
encrylmg=inlmg;
for k=1:iTimes
    for i=1:c
        for j=1:d
            Temp=encrylmg;
            i1=i+j;
            j1=i+2*j;
            i1=mod( i1,c);
            j1=mod(j1,d);
            if((i1~=0)&&(j1~=0))
                    w1(i1,j1)=Temp(i,j);
            end
        end
    end
    encrylmg=w1;
end
subplot(2,2,2);
imshow(encrylmg);
title('置乱后的秘密图像');
[filename,pathname]=uigetfile('*.bmp' , 'pick a carrier image file');
fn=[pathname filename];
Carrierlmg=imread(fn);
subplot(2,2,3);
imshow(Carrierlmg);
title('需要嵌入秘密消息的载体源图像');
StegoC=bitset(Carrierlmg,1,encrylmg);
subplot(2,2,4);
imshow(StegoC);
title('嵌入秘密消息后的伪装载体');


