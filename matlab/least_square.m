function [ k,m ] = least_square( x, y )
%LEAST_SQUARE Summary of this function goes here
%   Detailed explanation goes here
k = (x'*x)\(x'*y);

m = mean(y-x*k);

end

