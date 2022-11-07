
% 数字水印的嵌入
[ watermarkimagergb, watermarkimage, waterCA, watermark, correlationU, correlationV]= wavemarksvd( '1.png', '2.png', 1983, 'db6', 2, 0.1 , 0.99 );


 [ corr_coef, corr_DCTcoef] = wavedetect( '2.png', '1.png', 1983, 'db6', 2, 0.1 , 0.99)
