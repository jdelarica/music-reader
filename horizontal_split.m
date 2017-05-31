function [img_s] = horizontal_split(img)
% HORIZONTAL_SPLIT 

% input : img: Input image 
% img = imread('img/cumple.jpg');

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
z = find(hist_h==0); % Vector que guarda los índices donde el histograma es cero.

k = 1;
for i = 1:length(z)-1;
    if(z(i+1)-z(i))~=1
        img_s{k}=img(z(i):z(i+1),:);
        k = k+1;
    end
end




end