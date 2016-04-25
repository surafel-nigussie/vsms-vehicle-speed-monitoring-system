
clc;
clear all;
close all;
img = imread('car (4).jpg');
img = rgb2gray(img);
img = Thresholding(img);%Function which is found  in the same directory%
cc = bwconncomp(img, 8);
n = cc.NumObjects;
label = bwlabel(img);
imshow(img);