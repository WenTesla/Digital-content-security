%% 加噪攻击
r=normrnd(0.1,2,length(y2),2);
v=y2+r;
audiowrite('cracked.wav',v,fs);
figure;
subplot(1,3,1);plot(x);title('原始音频');
subplot(1,3,2);plot(y2);title('嵌入水印音频');
subplot(1,3,3);plot(v);title('被攻击的水印音频');
y4=dct(v);
y4=reshape(y4,1,m*n);
y3=reshape(y,1,m*n);
w1=(y4(1:4096)-y3(1:4096))/a;
w1=reshape(w1,64,64);
figure;imshow(w1);title('攻击后提取出来的水印');