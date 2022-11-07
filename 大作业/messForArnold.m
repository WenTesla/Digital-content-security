G=imread('1.jpg');
w0=double(G)/255;
[m,n]=size(w0);
w1=w0;
subplot(1,5,1);
imshow(w1,[]);
title('原图');
for k=1:1
    for x=1:m
        for y=1:n
            x1=x+y;
            y1=x+2*y;
            if x1>m
                x1=mod(x1,m);
            end
            if y1>n
                y1=mod(y1,n);
            end
            if x1==0
                x1=m;
            end
            if y1 == 0
                y1=n;
            end
            w1(x1,y1)=w0(x,y);
        end
    end
    w0=w1;
end
subplot(1,5,2);
imshow(w1,[]);
title('变换一次');
for k=1:15
    for x=1:m
        for y=1:n
            x1=x+y;
            y1=x+2*y;
            if x1>m
                x1=mod(x1,m);
            end
            if y1>n
                y1=mod(y1,n);
            end
            if x1==0
                x1=m;
            end
            if y1 == 0
                y1=n;
            end
            w1(x1,y1)=w0(x,y);
        end
    end
    w0=w1;
end
subplot(1,5,3);
imshow(w1,[]);
title('变换15次');
for k=1:95
    for x=1:m
        for y=1:n
            x1=x+y;
            y1=x+2*y;
            if x1>m
                x1=mod(x1,m);
            end
            if y1>n
                y1=mod(y1,n);
            end
            if x1==0
                x1=m;
            end
            if y1 == 0
                y1=n;
            end
            w1(x1,y1)=w0(x,y);
        end
    end
    w0=w1;
end
subplot(1,5,4);
imshow(w1,[]);
title('变换95次');
% imwrite(mat2gray(w1),'no2.jpg');
