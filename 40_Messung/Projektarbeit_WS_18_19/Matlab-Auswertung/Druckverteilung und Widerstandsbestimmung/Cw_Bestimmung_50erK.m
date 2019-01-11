clear
clc

folder = 'C:\Users\Flo\Documents\GitHub\Stumpfkoerper-WS-18-19\40_Messung\Projektarbeit_WS_18_19\Daten\Walzenpaar 50\Aktuation';
list_1 = dir(folder);

for i = 1 : length(list_1) - 2
    list_2 = dir([folder,'\',list_1(i+2).name]);
    for j = 1 : length(list_2) - 2
        if list_2(j+2).isdir
            temp = [folder,'\',list_1(i+2).name,'\',list_2(j+2).name,'\','*.txt'];
            disp(temp)
            list_3 = dir(temp);
            for k = 1 : length(list_3)
                data = mean(import_data([folder,'\',list_1(i+2).name,'\',list_2(j+2).name,'\',list_3(k).name]));
                disp(data)
                plot(data(1:22))
                xlswrite([folder,'\',list_1(i+2).name,'\',list_2(j+2).name,'\',list_3(k).name(1:end-3),'xlsx'],data)
            end
        end
    end
end