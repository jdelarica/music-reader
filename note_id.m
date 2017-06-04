function [data] = note_id(note)
% NOTE_ID identifies the type of element from a music sheet.
% 
% [data]=NOTE_ID(note) receives a part from the music sheet with a single
% element and recognizes the type of element it is, returning it as a
% String in DATA.

% Author:   Javier de la Rica
% Date :    June 2017

[object,type] = m_figure(note);

data = [];
if type == 1 % (Note)
    height = note_height(note);
    data = [object ' ' height];
else
    data = object;
end


end