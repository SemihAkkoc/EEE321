x=ReadMyImage('Part5.bmp');
figure;
subplot(2,2,1);
DisplayMyImage(x);
title('image itself')

h1 = [0.5 -0.5;0 0];

h2 = [0.5 0;-0.5 0];

subplot(2,2,2);
[y1]=DSLSI2D(h1,x);
s1 = y1.*y1;
DisplayMyImage(s1);
title('image convolved with h1')

subplot(2,2,3);
[y2]=DSLSI2D(h2,x);
s2 = y2.*y2;
DisplayMyImage(s2);
title('image convolved with h2')

subplot(2,2,4);
h3=0.5*h2+0.5*h1;
[y3]=DSLSI2D(h3,x);
s3 = y3.*y3;
DisplayMyImage(s3);
title('image convolved with h3')


function []=DisplayMyImage(Image)
Image=Image-min(min(Image));
imshow(uint8(255*Image/max(max(abs(Image)))));
end