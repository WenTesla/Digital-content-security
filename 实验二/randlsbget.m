% 函数功能: 本函数将完成提取隐秘于LSB 上的秘密消息
function result = randlsbget( output, len_total, goalfile, key)
ste_cover = imread( output) ;
ste_cover = double( ste_cover ) ;
% 判断嵌入消息量是否过大
[ m, n] = size( ste_cover ) ;
frr = fopen( goalfile, 'a') ;
% p 作为消息嵌入位数计数器, 将消息序列写回文本文件
p = 1;
% 调用随机间隔函数选取像素点
[ row, col] = randinterval( ste_cover , len_total, key) ;
for i = 1:len_total
    if bitand( ste_cover( row( i) , col( i) ) , 1) == 1
        fwrite( frr, 1, 'ubit1') ;
        result( p, 1 ) = 1;
    else
        fwrite( frr, 0, 'ubit1') ;
        result( p, 1 ) = 0;
    end
    if p == len_total
        break;
    end
    p = p + 1;
end
fclose( frr) ;