% @author: Armando Salazar
% @date: 03-11-23

clear, clc
% fprintf('Hi%s\n', 'Armando');

values_x = zeros(1, 51);
values_y = zeros(1, 51);
values_z = zeros(1, 51);
index = 1;
for t = 0:8*pi/50:8*pi
    fprintf('%f\n', t);
    values_x(index) = sin(t);
    values_y(index) = cos(t);
    values_z(index) = t;
    index = index + 1;
end
clear index t
plot3(values_x, values_y, values_z);

% t = 0:pi/50:10*pi;
% st=sin(t);
% ct=cos(t);
% plot3(st,ct,t);