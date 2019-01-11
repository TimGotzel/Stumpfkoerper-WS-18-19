clear
clc

pressure = mean(import_data_ref('C:\Users\Flo\Documents\GitHub\Stumpfkoerper-WS-18-19\40_Messung\Projektarbeit_WS_18_19\Daten\Referenzkonfig\Aktuation\0kPa\0000rpm.txt'));

wake_n(pressure);