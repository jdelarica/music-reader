function [compass1] = vertical_split(staff)

staff_inv = 1-staff;

% Horizontal and vertical histograms
hist_v = sum(staff_inv);
hist_h = sum(staff_inv');


M = max(hist_v(:,size(hist_v,2)/3:end));

split1 = find(hist_v==M);
split1 = [1 split1];

% figure(1)
% subplot(2,1,2),bar(hist_v);
% subplot(2,1,1),imshow(staff);
% set(gca,'Xlim',[0 size(staff,2)])

compass={};
k = 1;
M = length(split1);

for i = 1:M
    if i == M
    compass{k} = staff(:,split1(i):end);
    else
        compass{k} = staff(:,split1(i):split1(i+1));
    end
    k = k+1;
end


%%%%%%%%
% In the previous split may appear useless gaps, so we will filter in order
% to obtain only the useful information from the image.
compass2 = {};
compass1 = {};
w = [];
k = 1;
% lim = length(compass);

% First we will make sure the histogram has 5 maximum values, corresponding
% to the 5 lines of the staff.

for i = 1:length(compass)
    a = compass{i};
    a_inv = 1-a;
    hist_h = sum(a_inv');
%     In case the lines have not the same length...
    M = find(hist_h>=0.75*max(hist_h));
    if length(M) == 5
        compass2{k} = a;
        w(k) = length(a);
        k = k+1;
    end
end

% lim = length(compass2);
M = max(w);

k = 1;
for i = 1:length(compass2)
    if length(compass2{i})>=(0.3*M)
        compass1{k} = compass2{i};
        k = k+1;
    end
end

end
