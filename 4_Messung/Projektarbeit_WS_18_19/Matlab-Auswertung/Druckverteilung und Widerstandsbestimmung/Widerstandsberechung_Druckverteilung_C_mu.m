%% Import data from text file.
% Script for importing data from the following text file:
%
%    C:\Users\Flo\Documents\GitHub\Stumpfkoerper-WS-18-19\4_Messung\Projektarbeit_WS_18_19\Daten\Referenzkonfig\Aktuation\0kPa\0rpm.txt
%
% To extend the code to different selected data or a different text file,
% generate a function instead of a script.

% Auto-generated by MATLAB on 2019/01/09 17:43:32

%% Initialize variables.
filename = 'C:\Users\Flo\Documents\GitHub\Stumpfkoerper-WS-18-19\4_Messung\Projektarbeit_WS_18_19\Daten\Referenzkonfig\Aktuation\C_mu 0_48\0rpm.txt';
delimiter = '\t';

%% Read columns of data as text:
% For more information, see the TEXTSCAN documentation.
formatSpec = '%*s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to the format.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'TextType', 'string',  'ReturnOnError', false);

%% Close the text file.
fclose(fileID);

%% Convert the contents of columns containing numeric text to numbers.
% Replace non-numeric text with NaN.
raw = repmat({''},length(dataArray{1}),length(dataArray)-1);
for col=1:length(dataArray)-1
    raw(1:length(dataArray{col}),col) = mat2cell(dataArray{col}, ones(length(dataArray{col}), 1));
end
numericData = NaN(size(dataArray{1},1),size(dataArray,2));

for col=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32]
    % Converts text in the input cell array to numbers. Replaced non-numeric
    % text with NaN.
    rawData = dataArray{col};
    for row=1:size(rawData, 1)
        % Create a regular expression to detect and remove non-numeric prefixes and
        % suffixes.
        regexstr = '(?<prefix>.*?)(?<numbers>([-]*(\d+[\.]*)+[\,]{0,1}\d*[eEdD]{0,1}[-+]*\d*[i]{0,1})|([-]*(\d+[\.]*)*[\,]{1,1}\d+[eEdD]{0,1}[-+]*\d*[i]{0,1}))(?<suffix>.*)';
        try
            result = regexp(rawData(row), regexstr, 'names');
            numbers = result.numbers;
            
            % Detected commas in non-thousand locations.
            invalidThousandsSeparator = false;
            if numbers.contains('.')
                thousandsRegExp = '^[-/+]*\d+?(\.\d{3})*\,{0,1}\d*$';
                if isempty(regexp(numbers, thousandsRegExp, 'once'))
                    numbers = NaN;
                    invalidThousandsSeparator = true;
                end
            end
            % Convert numeric text to numbers.
            if ~invalidThousandsSeparator
                numbers = strrep(numbers, '.', '');
                numbers = strrep(numbers, ',', '.');
                numbers = textscan(char(numbers), '%f');
                numericData(row, col) = numbers{1};
                raw{row, col} = numbers{1};
            end
        catch
            raw{row, col} = rawData{row};
        end
    end
end


%% Create output variable
pressure_raw2 = cell2mat(raw);

pressure = mean(pressure_raw2);

%function [Cw] = wake(pressure)

%%separate pressures
total_pressure(1:11) = pressure(22:-1:12);
total_pressure(12:33) = pressure(1:22);
static_pressure(1:3) = pressure(32:-1:30);
static_pressure(4:8) = pressure(28:32);

%%positions as designed
position_pitot = [0:9:9*32];
position_prandtl = [0:40:280]+15;

%position_pitot_real= [0:9:9*21];
%position_prandtl_real =[0:40:160];

% fit total pressure
data = total_pressure;
pos = position_pitot;
[~,id] = min(data);
middle = pos(id);
beta = [0.001, -0.001, min(data),max(data), -middle];
formula1 = @(beta,x) (1+beta(1).*(x+beta(5)).^2).*exp(beta(2).*(x+beta(5)).^2) * (beta(3) - beta(4)) + beta(4);
beta1 = nlinfit(pos,data,formula1,beta);

%%Fit static pressure
data = static_pressure;
pos = position_prandtl;
beta = [min(data),max(data),beta1(5)];
formula2 = @(beta,x) (1+beta1(1).*(x+beta(3)).^2).*exp(beta1(2).*(x+beta(3)).^2) * (beta(1) - beta(2)) + beta(2);
beta2 = nlinfit(pos,data,formula2,beta);


%%Calculate Cd
    %%dyn_pressure_fs entspricht q_infty
dyn_pressure_fs= beta1(4) - beta2(2);
    %%static_pressure_fs entspricht p_infty
static_pressure_fs = beta2(2);
ref_length = 0.0534;
    
    %%siehe Formel 4.10 im Bericht
fun = @(x) (2 * sqrt((formula1(beta1,x) - formula2(beta2,x)) / dyn_pressure_fs) .* (1- sqrt((formula1(beta1,x) - static_pressure_fs) / dyn_pressure_fs)));
Cd = integral(fun,min(position_prandtl),max(position_prandtl))/1000/ref_length

%%plot
x = linspace (min(position_pitot),max(position_pitot),1001);
ref_length = ref_length * 1000;
x_plot = (x + beta1(5)) / ref_length;
position_pitot_plot = (position_pitot(12:33) + beta1(5))/ref_length;
position_prandtl_plot = (position_prandtl(4:8) + beta1(5))/ref_length;

figure()
plot(position_pitot_plot,total_pressure(12:33), 'x',position_prandtl_plot,static_pressure(4:8),'x',x_plot,formula1(beta1,x),x_plot,formula2(beta2,x))

%title(['Cw:_',num2str(
ylabel('\Delta p [Pa]')
xlabel('y/d [-]')
set(gca,'box','on')
legend('p_t Daten (Rechen)', 'p Daten(Rechen)', 'p_t Verauf (fit)' , 'p Verlauf (fit)', 'location', 'northeastoutside')
%% Clear temporary variables
clearvars filename delimiter formatSpec fileID dataArray ans raw col numericData rawData row regexstr result numbers invalidThousandsSeparator thousandsRegExp;