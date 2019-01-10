pressure_raw=load('C:\Users\Systemverwalter\Desktop\Projektarbeit_WS_18_19\Daten\Walzenpaar 50\Oberflächendrücke\Data001.txt');
pressure=mean(pressure_raw);

% separate pressures
staudruck = pressure(16);
top_side = pressure(1:1,16:30)/staudruck;
bottom_side = pressure(1:1,2:16)/staudruck;
bottom_side_flipped= fliplr(bottom_side);

x = [0,0,0.44,2.68,6.59,11.75,23.6,38.6,53.6,68.6,83.6,98.6,113.6,128.6,143.6]/190.6;
plot(x,top_side);
plot(x,bottom_side_flipped);