%Input Ordner %C:\Users\Flo\Documents\GitHub\Stumpfkoerper-WS-18-19\4_Messung\Projektarbeit_WS_18_19\Daten\Referenzkonfig\Aktuation
clc
folder = 'C:\Users\Flo\Documents\GitHub\Stumpfkoerper-WS-18-19\40_Messung\Projektarbeit_WS_18_19\Daten\Referenzkonfig\Aktuation';

list_2 = dir(folder);
for j = 1 :length(list_2) - 2
    if list_2(j+2).isdir
        temp = [folder, '\', list_2(j+2).name,'\','*m.txt'];
        disp(temp)
        list_3 = dir(temp);
        for k = 1 : length(list_3)
            data = mean(import_data_ref([folder,'\',list_2(j+2).name,'\',list_3(k).name]));
            Cw(k)=wake_n(data);
            %plot(data(1:22))
        end
        xlswrite([folder,'\',list_2(j+2).name,'\','Cw_Werte'],Cw)
    end
end
