clc;
close all;
clear all;
%% Read the image

Image = imread('BME7112_Data_File_6.tif');
% figure()
subplot(2,4,1)
imshow(Image)
axis square
title('Original Image')

%% Sobel Oprater
Image = padarray(Image,[10 10],'both');
BW = edge(Image,'sobel','both',0.03);
Image1 = imoverlay(Image,BW,'green');
subplot(2,4,2)
% figure()
imshow(Image1);
axis square
title('Sobel Operater')

%% Prewite Operater
BW1 = edge(Image,'Prewitt','both',0.035);
Image2 = imoverlay(Image,BW1,'green');
subplot(2,4,3)
% figure()
imshow(Image2);
axis square
title('Prewitt Operater')

%% Canny Operator
BW2 = edge(Image,'canny',0.06);
Image3 = imoverlay(Image,BW2,'green');
subplot(2,4,4)
% figure()
imshow(Image3)
axis square
title('Canny Oprator');

%%  LoG Operater
BW3 = edge(Image,'log',0.02,1);
Image3 = imoverlay(Image,BW3,'green');
subplot(2,4,5)
% figure()
imshow(Image3);
axis square
title('LoG Operater')

%% 'Roberts'
BW4 = edge(Image,'Roberts',0.035);
Image4 = imoverlay(Image,BW4,'green');
subplot(2,4,6)
% figure()
imshow(Image4);
axis square
title('Roberts Operater')

%% zero-crossing Operater
BW5 = edge(Image,'zerocross',0.002);
Image5 = imoverlay(Image,BW5,'green');
subplot(2,4,7)
% figure()
imshow(Image5);
axis square
title('zerocross Operater')

