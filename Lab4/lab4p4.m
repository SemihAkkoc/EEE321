x=ReadMyImage('Part4.bmp');
D = rem(22103132, 7);

h = zeros(30+D,30+D);
for k=1:30+D
  for l=1:30+D
    h(k,l)=sinc(0.7*(k-1-((29+D)/2)))*sinc(0.7*(l-1-((29+D)/2)));
  end
end


h2 = zeros(30+D,30+D);
for k=1:30+D
  for l=1:30+D
    h2(k,l)=sinc(0.4*(k-1-((29+D)/2)))*sinc(0.4*(l-1-((29+D)/2)));
  end
end

h3 = zeros(30+D,30+D);
for k=1:30+D
  for l=1:30+D
    h3(k,l)=sinc(0.1*(k-1-((29+D)/2)))*sinc(0.1*(l-1-((29+D)/2)));
  end
end

y=DSLSI2D(h,x);
y2=DSLSI2D(h2,x);
y3=DSLSI2D(h3,x);

figure;

subplot(3,1,1);
DisplayMyImage(y)
title('image with B=0.7')

subplot(3,1,2);
DisplayMyImage(y2)
title('image with B=0.4')

subplot(3,1,3);
DisplayMyImage(y3)
title('image with B=0.1')

function []=DisplayMyImage(Image)
    Image=Image-min(min(Image));
    imshow(uint8(255*Image/max(max(abs(Image)))));
end