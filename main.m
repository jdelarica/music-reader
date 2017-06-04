% MAIN

img = imread('img/cumple.jpg');
% First, I split the sheet horizontally.
img_s = horizontal_split(img);
sheet = [];
% Splitting the compasses.
% STAFF DETECTION
staff = staff_detection(img_s);
% COMPASS SPLIT
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
    
%     sheet = [sheet '\n'];
end

% close(64);

sheet_read = sheet_reader(sheet);
sheet_translated = translator(sheet_read);
y = playing(sheet_translated); 
