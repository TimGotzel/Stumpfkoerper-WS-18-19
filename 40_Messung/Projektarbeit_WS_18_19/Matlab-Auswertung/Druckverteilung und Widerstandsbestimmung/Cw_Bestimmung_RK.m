%Input Ordner %C:\Users\Flo\Documents\GitHub\Stumpfkoerper-WS-18-19\4_Messung\Projektarbeit_WS_18_19\Daten\Referenzkonfig\Aktuation
function [C_w] = Cw_Bestimmung_RK
function [Result] = textfilefinder (directory)
cd directory;
FolderInfo = dir(directory);
if FolderInfo.folder == 'C:\Users\Flo\Documents\GitHub\Stumpfkoerper-WS-18-19\4_Messung\Projektarbeit_WS_18_19\Daten'
    Result = 1;
end
if FolderInfo.isdir == 1 && 
   FolderInfo
    dir *.txt*;
    textfilefinder(
else
    
    Result = 1;
end