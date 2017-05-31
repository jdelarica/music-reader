% MAIN

img = imread('img/cumple.jpg');
% img = imread('img/noche-de-paz.jpg');
% figure (1), 
% imshow(double(img))
% imshow(img);
% SEPARAR PENTAGRAMAS
% Primero separo los pentagramas horizontalmente.
img_s = horizontal_split(img);
sheet = [];
% Después separo los compases de cada pentagrama.
% RECONOCIMIENTO DEL PENTAGRAMA
staff = staff_detection(img_s);
% SEPARAR COMPASES
for i = 1:length(staff)
    compass = vertical_split(staff{i});
    
    for j = 1:length(compass)
        
        notes = object_detection(compass{j});
        
        for k = 1:length(notes)
            
            note = notes{k};
            data = note_id(note);
            sheet = [sheet data '; '];
        end
    end
end

sheet_read = sheet_reader(sheet);
sheet_translated = translator(sheet_read);
y = playing(sheet_translated); 
