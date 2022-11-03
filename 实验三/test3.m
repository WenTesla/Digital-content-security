% 全过程
%% 水印嵌入
[count,msg,result] = hidedctadv('Image.jpg','EXP3jm.jpg','1.txt',0157,20);

%% 提取水印
result = extractdctadv('EXP3jm.jpg','2.txt',0157,count);

