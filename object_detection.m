function [notes] = object_detection(compass)
% OBJECT_DETECTION recognizes from an image if it is a music sheet or not.
% 
% [notes]=OBJECT_DETECTION(compass) 

% Author:   Javier de la Rica
% Date :    June 2017

compass_inv = 1 - compass;
hist_v = sum(compass_inv);

% I compute the histogram of the note. The zeros of the histogram are the
% limits of the note.
o = mode(double(hist_v(:)));
hist_v = hist_v - o;
z = find(hist_v==0); % Zeros vector.


notes = {};
k = 1;

for i = 1:length(z)-1
    if(z(i+1)-z(i))~=1
        notes{k} = compass(:,z(i)-1:z(i+1)+1);
        k = k+1;
    end
end

end