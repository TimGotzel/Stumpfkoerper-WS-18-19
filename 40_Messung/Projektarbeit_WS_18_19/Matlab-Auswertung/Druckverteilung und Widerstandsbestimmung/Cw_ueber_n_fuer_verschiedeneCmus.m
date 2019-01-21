n = [0 500 1000 1500 1800 1900 2000 2100 2200 2300 2400 2500];
Cw50norm = CwWerteges50;
str = ((n/60)*0.0534)/15;
x = str;
x3= str(2:12);

% for i=1:5
%     for j=1:12
%         Cw50norm(i,j) = Cw50(i,j)/Cw50(i,1);
%     end
% end


y1 = Cw50norm(1,1:12);
y2 = Cw50norm(2,1:12);
y3 = Cw50norm(3,2:12);
y4 = Cw50norm(4,1:12);
y5 = Cw50norm(5,1:12);

figure()
plot(x,y1,x,y2,x,y4,x,y5)

xlabel('Str [-]');
ylabel('C_{W} [-]');