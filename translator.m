function sheet_translated = translator(sheet_read)
% TRANSATOR translates the String in order to play the music piece.
% 
% [sheet_translated]=TRANSLATOR(sheet_read) translates the information from
% the String SHEET_READ into frequencies so the next function can actually
% play the music piece with the corresponding frequencies. It returns a
% vector SHEET_TRANSLATED which contains the frequencies corresponding to
% each note.

% Author:   Javier de la Rica
% Date :    June 2017

[m,n] = size(sheet_read);
sheet_translated = {};
for i = 1:n
   
    if sheet_read{i} == 'c4;'
        sheet_translated{i} = 261.626;
    elseif sheet_read{i} == 'd4;'
        sheet_translated{i} = 293.665;
    elseif sheet_read{i} == 'e4;'
        sheet_translated{i} = 329.628;
    elseif sheet_read{i} == 'f4;'
        sheet_translated{i} = 349.228;
    elseif sheet_read{i} == 'g4;'
        sheet_translated{i} = 391.995;
    elseif sheet_read{i} == 'a4;'
        sheet_translated{i} = 440;
    elseif sheet_read{i} == 'b4;'
        sheet_translated{i} = 493.883;
    elseif sheet_read{i} == 'c5;'
        sheet_translated{i} = 523.251;
    elseif sheet_read{i} == 'd5;'
        sheet_translated{i} = 587.330;
    elseif sheet_read{i} == 'e5;'
        sheet_translated{i} = 659.255;
    elseif sheet_read{i} == 'f5;'
        sheet_translated{i} = 698.456;
    elseif sheet_read{i} == 'g5;'
        sheet_translated{i} = 783.991;
    elseif sheet_read{i} == 'a5;'
        sheet_translated{i} = 880;
    end

    
    
end



end