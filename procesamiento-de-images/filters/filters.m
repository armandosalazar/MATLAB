% filters
% @author: Armando Salazar
% @date: 09-04-24

clear; clc; close all;

I = imread("input/lenna.png");

IGray = I(:,:,1) / 3 + I(:,:,2) / 3 + I(:,:,3) / 3;

ILaplace = laplace(IGray);
