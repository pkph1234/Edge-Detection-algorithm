clc;
close all;
clear all;
%% Read the image

Image = im2double(imread('BME7112_Data_File_6.tif'));
Image = padarray(Image,[1 1],'both');
figure(1)

imshow(Image)
axis square
title('Original Image')
%% Kirsch operater
% edge detection
x1 = [1 sqrt(2) 1; 0 0 0 ; -1 -sqrt(2) -1]/(2+sqrt(2));
x2 = [1 0 -1 ; sqrt(2) 0 -sqrt(2) ; 1 0 -1]/(2+sqrt(2));
x3 = [0 -1 sqrt(2) ; 1 0 -1 ; -sqrt(2) 1 0]/(2+sqrt(2));
x4 = [sqrt(2) -1 0; -1 0 1; 0 1 -sqrt(2)]/(2+sqrt(2));
% line detection (Which is used to detect the Stright line in the Image)
x5 = [0 1 0 ; -1 0 -1 ; 0 1 0]/2;
x6 = [-1 0 1 ; 0 0 0 ; 1 0 -1]/2;
x7 = [1 -2 1 ; -2 4 -2 ; 1 -2 1]/6;
x8 = [-2 1 -2 ; 1 4 1 ; -2 1 -2]/6;
x9 = [1 1 1 ; 1 1 1 ; 1 1 1]/3;

%% Convolution
Image_x1 = imfilter(Image,x1);
Image_x2 = imfilter(Image,x2);
Image_x3 = imfilter(Image,x3);
Image_x4 = imfilter(Image,x4);
Image_x5 = imfilter(Image,x5);
Image_x6 = imfilter(Image,x6);
Image_x7 = imfilter(Image,x7);
Image_x8 = imfilter(Image,x8);
Image_x9 = imfilter(Image,x9);
%% PLoting the individual Mask
figure(2)
subplot(3,3,1)
imshow(Image_x1);
title('1');
subplot(3,3,2)
imshow(Image_x2);
title('2');
subplot(3,3,3)
imshow(Image_x3);
title('3');
subplot(3,3,4)
imshow(Image_x4);
title('4');
subplot(3,3,5)
imshow(Image_x5);
title('5');
subplot(3,3,6)
imshow(Image_x6);
title('6');
subplot(3,3,7)
imshow(Image_x7);
title('7');
subplot(3,3,8)
imshow(Image_x8);
title('8');
subplot(3,3,9)
imshow(Image_x9);
title('9');

[a b] = size(Image);
% FInding the maximim value from the 8 different masks
% for i = 1:a
%     for j = 1:b
%         x1 = [Image_x1(i,j) , Image_x2(i,j) ,Image_x3(i,j) ,Image_x4(i,j), Image_x5(i,j) , Image_x6(i,j) , Image_x7(i,j) , Image_x8(i,j) , Image_x9(i,j)];
%         x1 = max(x1(:));
%         Image_new_edge(i,j) = x1;
%     end
% end
% Image_new_edge = abs(Image_new_edge);
%% Finding the magnitude
Image_new_edge = sqrt(Image_x1.^2 + Image_x2.^2 + Image_x3.^2 + Image_x4.^2 + Image_x5.^2 + Image_x6.^2 + Image_x7.^2 + Image_x8.^2);
figure()
imshow(Image_new_edge)
title('edge & Line details');
% COnvert into binary with threshold
Image_new2 = im2bw(Image_new_edge,0.035);
% edhe thining operation
Image_new2 = bwmorph(Image_new2,'remove');s
figure(5)
imshow(Image_new2)
title('BW mask of Edges')
axis square
figure(3)
Image_new1 = imoverlay(Image,Image_new2,'green');
figure()
imshow(Image_new1)
axis square
title('Overlayed Image');
