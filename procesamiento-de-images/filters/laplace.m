%function [outputArg1,outputArg2] = untitled(inputArg1,inputArg2)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%outputArg1 = inputArg1;
%outputArg2 = inputArg2;
%end

function ILaplace = laplace(IGray)
  [x, y] = size(IGray);
  fprintf("(x: %d, y: %d)\n", x, y);
  for row=3:(x-2)
    for column=3:(y-2)
    end
  end
  ILaplace = 0;
end

