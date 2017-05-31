function [figure, type] = m_figure(object)

%     inv = 1-object;
    hist_h = sum((1-object)');

    lines = find(hist_h==max(hist_h));

    object(lines,:)=1;
    
    hist_v = sum(1-object);
    hist_h = sum((1-object)');
    

    h = find(hist_h>0);
    v = find(hist_v>0);

    x = v(1)-1;
    y = h(1)-1;
    y_wide = h(end)+2-y;
    x_wide = v(end)+2-x;
    
    object = imcrop(object,[x y x_wide y_wide]);


%     inv=1-object;
    hist_v=sum(1-object);
    hist_h=sum((1-object)');

    h = find(hist_h==0);
    [~, M] = max(hist_v);

    object(h,M)=0;
    
    database = {};
    load('database.mat');
    
        
%     inicio=1;
    max_vector={{}}; % Almacenará los resultados de la comparación table a table
    comp=[]; % Almacenará los resultados de la correlación
%     maxit1=size(database,2);
    
    for i=1:size(database,2)
        table=database{1,i};
        
%         maxit2=
        for j=1:size(database{i},1);

            template=table{j,2};

            object_resized = imresize(object,size(template));
        
            % Descomentar para depuración
%             figure
%             subplot(1,2,1),imshow(object_resized),title('figure a identificar');
%             subplot(1,2,2),imshow(template),title('Plantilla');
%             pause(0.2);
        
            similitud = corr2(template,object_resized);

            comp = [comp similitud];
        end
        
        % Del vector de resultados de la correlación extraemos el máximo
        [j previous_note]=max(comp);

        max_vector{i}={j table{previous_note,1} table{previous_note,2}};
        
        % Reseteamos el vector de resultados
        comp=[];
    end

    [value type]=max([max_vector{1,1}{1} max_vector{1,2}{1} max_vector{1,3}{1}]);
 
     if type==1 && strcmp(max_vector{1,type}{2},'negra')         
         comp = [];
         table = database{1,1};
         for i=2:5
             
             template = table{i,2};
             top = size(object,2);
             check = zeros(1,top);
             if rem(i,2)==0 % even
                 check(floor(top/2):end)=1;
                 object2=[object; check];
                 object2=im2bw(object2);
             else
                check(1:floor(top/2))=1;
                object2=[check; object];
                object2=im2bw(object2);
             end
             

             object_resized = imresize(object2,size(template));
             simil = corr2(template,object_resized);
             comp = [comp simil];
             
         end

         [vl n]=max(comp);

         note_val=n+1;
         % Devolvemos la cadena de texto que identifica al type de nota.
         figure = table{note_val,1};
      
     elseif type==2 && (strcmp(max_vector{1,type}{2},'silencio de blanca') || strcmp(max_vector{1,type}{2},'silencio de negra'))

         hist_h = sum((1-object)');

         ind = find(hist_h>0);
         % Detectamos las líneas y calculamos la distancia entre ellas
         lineas=find(hist_h==max(hist_h));
         dist=lineas(2)-lineas(1);

         i=1;
         aux=false;
         % for i = 1:length(ind)-2
         while aux==false && i<length(ind)-2
             % Calculamos las distancias
             distance1=ind(i+1)-ind(i);
             distance2=ind(i+2)-ind(i+1);    
             
             % Comprobamos
             if distance1<dist && distance2==1
                 figure='silencio de blanca'; 
                 aux=true;
             end
             if distance1==1 && distance2<dist
                 figure='silencio de redonda';
                 aux=true;
             end
 
             i = i+1;
         end
% end
     else

         figure = max_vector{1,type}{2};
     end 
      
end

