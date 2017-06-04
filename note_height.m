function [ alt_nota ] = note_height( note )
% NOTE_HEIGHT computes the height from a given note on its music sheet.
% 
% [alt_nota] = NOTE_HEIGHT(note) computes the height from a given note,
% with its sheet lines in NOTE. It returns a string with the note which
% represents the corresponding height: Do, re, mi...

% Author:   Javier de la Rica
% Date :    June 2017

    inv_note=1-note;
    hist_h=sum(inv_note');


    ind = hist_h(find(hist_h>0));
    off = mode(double(ind(:)));
    hist_h = hist_h-off;  
    staff_lines = find(hist_h == max(hist_h));
    
    hist_h2 = hist_h;
    hist_h2(staff_lines)=0;
    
    
  
    
    % Sheet height
    staff_height=staff_lines(end)-staff_lines(1);

    % Distance between two lines
    % Supposing they are equidistant...
    lines_distance=staff_lines(2)-staff_lines(1);


    step1=lines_distance/2;

    step2=lines_distance/4;

    altura_intervals=staff_height+step1;


    intervals=[0:step1:altura_intervals]+staff_lines(1)-step2;

%    intervals=intervals+staff_lines(1)-step2;

    intervals=[intervals(1)-step1 intervals intervals(end)+step1];

    intervals=fliplr(intervals);
    
    

    vals_nota=find(hist_h2>0);
    pos_nota=mean(vals_nota);
    

    ind=0;
    if pos_nota>intervals(1)
        ind=1;
    end
    if pos_nota<intervals(end)
        ind=13;
    end
    if ind==0
        maxit=length(intervals);
        for i=1:maxit-1
            if intervals(i)>pos_nota && pos_nota>intervals(i+1)
                ind=i+1;
            end
        end
    end
    
    load('scale.mat');
%ind
    alt_nota=scale{ind};
    
    

end

