function sheet_read = sheet_reader(sheet)


S = strsplit(sheet);
[m,n] = size(S);
notes_aux = cell(1,n);
cont=1;

% c4 = 261.626; %Do
% d4 = 293.665; %Re
% e4 = 329.628; %Mi
% f4 = 349.228; %Fa
% g4 = 391.995; %Sol
% a4 = 440;     %La
% b4 = 493.883; %Si
% c5 = 523.251;
% d5 = 587.330;
% e5 = 659.255;
% f5 = 698.456;
% g5 = 783.991;
% a5 = 880;



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