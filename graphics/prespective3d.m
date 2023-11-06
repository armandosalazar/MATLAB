% @author: Armando Salazar
% @date: 05-11-23


clc, clear
%for var = inicio:fin
%for var = inicio:incremento:fin
values_t = zeros(1,51);
values_x = zeros(1,51);
values_y = zeros(1,51);
% vector = [2, 3, 2]; % vector de proyección


inc = 8 * pi / 50;
i = 1;
for t = 0:inc:8*pi
    values_t(i) = t;
    values_x(i) = cos(t);
    values_y(i) = sin(t);
    i = i +1;
end
clear u vector x y z
clear i inc t
plot3(values_x, values_y, values_t);
% table = table(values_t', values_x', values_y', values_t', 'VariableNames', {'t', 'x', 'y', 'z'});
clear values_t values_x values_y
% writetable(table, 'graphics/nombre_archivo.xlsx', 'Sheet','Hoja1');
% clear table
% plot3(table.x, table.y, table.z);
% axis equal
fprintf('Successfully!!\n\n');