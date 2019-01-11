clear
clc
folder = 'C:\Users\Flo\Documents\GitHub\Stumpfkoerper-WS-18-19\40_Messung\Projektarbeit_WS_18_19\Daten\Walzenpaar 50\Aktuation';
list_1 = dir(folder);
for i = 1 : length(list_1) - 2
list_2 = dir([folder,'\',list_1(i+2).name]);
for j = 1 : length(list_2) - 2
if list_2(j+2).isdir
cd ([folder,'\',list_1(i+2).name,'\',list_2(j+2).name])
delete *Cw_Werte.xlsx;
end
end
end