function [staff] = staff_detection(img_s)

% img_s es la imagen segmentada horizontalmente

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