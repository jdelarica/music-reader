function [data] = note_id(note)

[object,type] = m_figure(note);

data = [];
if type == 1 % (Note)
    height = note_height(note);
    data = [object ' ' height];
else
    data = object;
end

% figure,
% imshow(note),
% title('reading...'),
% pause(0.1)
end