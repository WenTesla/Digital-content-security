%% 隐藏
[ste_cover,len_total] = randlsbhide('lena.bmp','1.txt','output.bmp',2022)

%% 提取
result = randlsbget( 'output.bmp', len_total, '2.txt', 2022);