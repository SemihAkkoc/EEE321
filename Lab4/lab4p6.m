x=ReadMyImage('Part6x.bmp');
figure;
subplot(2,2,1)
DisplayMyImage(x);
title('original image')
h=ReadMyImage('Part6h.bmp');
% DisplayMyImage(h);

[y]=DSLSI2D(h,x);

y = abs(y);
subplot(2,2,2)
DisplayMyImage(y);
title('|y| image')

y= y.^(3);

subplot(2,2,3)
DisplayMyImage(y);
title('|y|^3 image')

[y]=DSLSI2D(h,x);

y= abs(y);
y= y.^(5);

subplot(2,2,4)
DisplayMyImage(y);
title('|y|^5 image')
