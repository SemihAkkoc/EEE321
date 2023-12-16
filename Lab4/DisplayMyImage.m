function []=DisplayMyImage(Image)
Image=Image-min(min(Image));
imshow(uint8(255*Image/max(max(abs(Image)))));