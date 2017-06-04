function [y] = playing(sheet_translated) 
% PLAYING computes the algorithm needed to play the chosen music piece.
% 
% [y]=PLAYING(sheet_translated) computes a sinousoid signal from
% SHEET_TRANSLATED, which is a vector of frequencies corresponding to the
% music piece's notes.  It returns a cell Y containing the information of
% the piece.

% Author:   Javier de la Rica
% Date :    June 2017

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
