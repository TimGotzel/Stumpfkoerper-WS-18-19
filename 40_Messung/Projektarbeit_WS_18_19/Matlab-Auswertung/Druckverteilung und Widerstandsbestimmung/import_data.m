function kPa500rpm01 = import_data(filename, startRow, endRow)
%IMPORTFILE Import numeric data from a text file as a matrix.
%   KPA500RPM01 = IMPORTFILE(FILENAME) Reads data from text file FILENAME
%   for the default selection.
%
%   KPA500RPM01 = IMPORTFILE(FILENAME, STARTROW, ENDROW) Reads data from
%   rows STARTROW through ENDROW of text file FILENAME.
%
% Example:
%   kPa500rpm01 = importfile('4kPa_500rpm_01.txt', 11, 1010);
%
%    See also TEXTSCAN.

% Auto-generated by MATLAB on 2019/01/09 13:50:13

%% Initialize variables.
delimiter = '\t';
if nargin<=2
    startRow = 11;
    endRow = inf;
end

%% Format string for each line of text:
%   column2: double (%f)
%	column3: double (%f)
%   column4: double (%f)
%	column5: double (%f)
%   column6: double (%f)
%	column7: double (%f)
%   column8: double (%f)
%	column9: double (%f)
%   column10: double (%f)
%	column11: double (%f)
%   column12: double (%f)
%	column13: double (%f)
%   column14: double (%f)
%	column15: double (%f)
%   column16: double (%f)
%	column17: double (%f)
%   column18: double (%f)
%	column19: double (%f)
%   column20: double (%f)
%	column21: double (%f)
%   column22: double (%f)
%	column23: double (%f)
%   column24: double (%f)
%	column25: double (%f)
%   column26: double (%f)
%	column27: double (%f)
%   column28: double (%f)
%	column29: double (%f)
%   column30: double (%f)
%	column31: double (%f)
%   column32: double (%f)
%	column33: double (%f)
%   column34: double (%f)
%	column35: double (%f)
%   column36: double (%f)
%	column37: double (%f)
%   column38: double (%f)
%	column39: double (%f)
%   column40: double (%f)
%	column41: double (%f)
%   column42: double (%f)
%	column43: double (%f)
%   column44: double (%f)
%	column45: double (%f)
%   column46: double (%f)
%	column47: double (%f)
%   column48: double (%f)
%	column49: double (%f)
%   column50: double (%f)
%	column51: double (%f)
%   column52: double (%f)
%	column53: double (%f)
%   column54: double (%f)
%	column55: double (%f)
%   column56: double (%f)
%	column57: double (%f)
%   column58: double (%f)
%	column59: double (%f)
%   column60: double (%f)
%	column61: double (%f)
%   column62: double (%f)
%	column63: double (%f)
%   column64: double (%f)
%	column65: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%*s%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'HeaderLines', startRow(1)-1, 'ReturnOnError', false);
for block=2:length(startRow)
    frewind(fileID);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', delimiter, 'HeaderLines', startRow(block)-1, 'ReturnOnError', false);
    for col=1:length(dataArray)
        dataArray{col} = [dataArray{col};dataArrayBlock{col}];
    end
end

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Create output variable
kPa500rpm01 = [dataArray{1:end-1}];