function [notes] = object_detection(compass)


compass_inv = 1 - compass;
hist_v = sum(compass_inv);
% hist_h = sum(compass_inv');

% Calculo el histograma de la nota. Los ceros de su histograma delimitan la
% nota.
o = mode(double(hist_v(:)));
hist_v = hist_v - o;
z = find(hist_v==0); % Vector de ceros que delimitan la nota.

% Como ya conozco los ceros, realizo la segmentación vertical.

notes = {};
k = 1;

for i = 1:length(z)-1
    if(z(i+1)-z(i))~=1
        notes{k} = compass(:,z(i)-1:z(i+1)+1);
        k = k+1;
    end
end

end