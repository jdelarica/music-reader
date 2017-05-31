function [y] = playing(sheet_translated) 
% fs = 8000;
fs = 44100;
Ts = 1/fs;

tmax = 170;
time = [0:Ts:tmax];

A = 2;

tal = 1/5;
k = exp(-time/tal);

[m,n] = size(sheet_translated);
y = {};
for i = 1:n
    y{i} = A*sin(2*pi*sheet_translated{i}*time).*k;
    sound(y{i},fs);
    
end
end
