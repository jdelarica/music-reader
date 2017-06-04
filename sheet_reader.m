function sheet_read = sheet_reader(sheet)
% SHEET_READER reads the music sheet from the String SHEET.
% 
% [sheet_read]=SHEET_REDER(sheet) reads the music sheet from the string
% SHEET and splits all the values inf SHEET into different cells in order
% to ease the playing.

% Author:   Javier de la Rica
% Date :    June 2017

S = strsplit(sheet);
[m,n] = size(S);
notes_aux = cell(1,n);
cont=1;

for i=1:n

    if S(1,i)== "c4;" || S(1,i)== "d4;" || S(1,i)== "f4;" || S(1,i)== "e4;" ...
       || S(1,i)== "g4;" || S(1,i)== "c5;" || S(1,i)== "a4;"
    
    notes_aux{1,cont}=S{1,i};
    cont=cont+1;
    end
    
end
    

sheet_read = cell(1,cont-1);

% Delete empty cells
for j=1:cont-1
    sheet_read{1,j}=notes_aux{1,j};
end
     
end