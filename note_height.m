function [ alt_nota ] = note_height( note )

    inv_note=1-note;
    hist_h=sum(inv_note');

%     figure(131)
%     subplot(2,2,1),barh(fliplr(hist_h));
%     set(gca,'Ylim',[0 size(inv,1)])
%     subplot(2,2,2),imshow(nota1);
%     subplot(2,2,4),bar(histv);
%     set(gca,'Xlim',[0 size(inv,2)]) 

    ind = hist_h(find(hist_h>0));
    off = mode(double(ind(:)));
    hist_h = hist_h-off;  
    staff_lines = find(hist_h == max(hist_h));
    
    hist_h2 = hist_h;
    hist_h2(staff_lines)=0;
    
    
  
    
    % Calculamos el alto del pentagrama
    staff_height=staff_lines(end)-staff_lines(1);

    % Calculamos la separación entre dos líneas del pentagrama
    % Supongo en todo momento que son equidistantes
    lines_distance=staff_lines(2)-staff_lines(1);

    % Creo un 'step1' que será el tamaño de la región de cada valor de
    % altura
    step1=lines_distance/2;
    % Igualmente, defino el tamaño medio del step1 como 'step2'
    step2=lines_distance/4;

    altura_intervals=staff_height+step1;


    intervals=[0:step1:altura_intervals]+staff_lines(1)-step2;

%    intervals=intervals+staff_lines(1)-step2;

    intervals=[intervals(1)-step1 intervals intervals(end)+step1];

    % Invertimos el vector porque los indices en la imagen están al revés
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

