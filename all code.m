% applying different types of noise
 i = imread('1.happy');
J = imnoise(i,'gaussian');
 k = imnoise(i,'salt & pepper',0.3);
 l = imnoise(i,'speckle');
  subplot(2,2,1)
 imshow(i)
 title('original image')
 subplot(2,2,2)
 imshow(J)
 title('gaussian noise')
  subplot(2,2,3)
 imshow(k)
 title('salt and pepper noise')
  subplot(2,2,4)
 imshow(l)
 title('speckle')
 % removing noise
 i = imread('1.happy');
  l = imnoise(i,'salt & pepper',0.05);
 h = fspecial('unsharp');
 j=imfilter(l,h);
 k = filter2(fspecial('average',3),l)/255;
 n = medfilt2(l,[5 5]);
 m =wiener2(l,[5 5]);
 subplot(2,3,1)
 imshow(i)
 title('original image')
 subplot(2,3,2)
 imshow(l)
 title('noisy image')
 subplot(2,3,3)
 imshow(j)
 title('linear filtered image')
 subplot(2,3,4)
 imshow(k)
 title('FIR filtered image')
 subplot(2,3,5)
 imshow(n)
 title('median filtered image')
 subplot(2,3,6)
 imshow(m)
 title('adaptive filtered image')
 % blurring and deblurring an image
 I = imread('1.happy');
    PSF = fspecial('motion', 21, 15);
blurred = imfilter(I, PSF, 'conv', 'circular');
  
wnr3 = deconvwnr(blurred, PSF,0.00005);
   subplot(1,3,1)
   imshow(I);
   title('original image')
   subplot(1,3,2)
   imshow(blurred);
   title('blurred image')
   subplot(1,3,3)
   imshow(wnr3);
   title('deblurred image')
   % edge detection
   i=imread('1.happy');
BW = edge(I,'canny');
subplot(1,2,1)
imshow(i)
title('original image')
subplot(1,2,2)
imshow(BW)
title('canny edge')
% histogram equalization
I = imread('1.happy');
J = histeq(I);
subplot(2,2,1);
imshow(I);
subplot(2,2,2);
imhist(I,64);
subplot(2,2,3)
imshow(J)
subplot(2,2,4)
imhist(J,64)
% change contrast
i=imread('1.happy');
J = imadjust(i);
subplot(1,2,1)
imshow(i)
title('original image')
subplot(1,2,2)
imshow(J)
title('new contrast')
% converting rgb image to black and white
k=imread('image_0001.jpg');
i=rgb2gray(k);
imshow(i);
a=im2bw(k);
imshow(a);
subplot(211);imshow(k);subplot(212);imshow(i);

% reading all images in a file
scrfile=dir('D:\project\*.jpg');
for i=1:length(scrfile)
filename=strcat('D:\project\',scrfile(i).name);
i=imread(filename);
figure,imshow(i);
end
  
 