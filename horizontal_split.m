function [img_s] = horizontal_split(img)
% HORIZONTAL_SPLIT splits horizontally the different lines of the image.
% 
% [img_s]=HORIZONTAL_SPLIT(img) receives an image IMG from a music sheet
% and it splits it in different lines, no matter if they are staff lines or
% just text. It gives in IMG_S a cell where each position is a matrix which
% represents the split image.

% Author:   Javier de la Rica
% Date :    June 2017

if strcmp(class(img),'uint8') && max(img(:))<=1
    img = double(img);
    
elseif strcmp(class(img),'double') && max(img(:))>1
    img = uint8(img);
end

% Image binarization
img = im2bw(img);
inv = 1-img;

% Horizontal histogram
hist_h = sum(inv');
img_s = {};
% We look for when the histogram values are zeros, these are the points
% where we have to split the image.
z = find(hist_h==0); % Vector which saves the index where the histogram's value is zero.

k = 1;
for i = 1:length(z)-1;
    if(z(i+1)-z(i))~=1
        img_s{k}=img(z(i):z(i+1),:);
        k = k+1;
    end
end




end