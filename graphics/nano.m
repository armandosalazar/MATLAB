% @author: Armando Salazar
% @date: 03-11-23

clc, clear
%for var = inicio:fin
%for var = inicio:incremento:fin
values_t = zeros(1,51);
values_x = zeros(1,51);
values_y = zeros(1,51);
vector = [4, 5, 7];

inc = 8 * pi / 50;
i = 1;
for t = 0:inc:8*pi
    %fprintf('%f\n', t);
    % values_t = [values_t, t]; %añadir al final
    values_t(i) = t;
    values_x(i) = cos(t);
    values_y(i) = sin(t);
    i = i +1;
end
clear i inc t
table = table(values_t', values_x', values_y', values_t', 'VariableNames', {'t', 'x', 'y', 'z'});
clear values_t values_x values_y
%writetable(table, 'graphics/nombre_archivo.xlsx', 'Sheet','Hoja1');
%clear table
disp('Successfully!!');