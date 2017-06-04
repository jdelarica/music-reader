function [staff] = staff_detection(img_s)
% STAFF_DETECTION recognizes from an image if it is a music sheet or not.
% 
% [staff]=STAFF_DETECTION(img_s) analyzes the different lines from a
% split image, recognizing if it is a music sheet or not. It returns a
% cell vector containing those which actually are music sheets.

% Author:   Javier de la Rica
% Date :    June 2017

staff = {};
k = 1;

for i = 1:length(img_s)
    a = img_s{i};
    a_inv = 1-a;
    hist_h = sum(a_inv');
    M = find(hist_h>=0.75*max(hist_h));
    
    if length(M)==5
        staff{k} = img_s{i};
        k = k+1;
    end
end
end