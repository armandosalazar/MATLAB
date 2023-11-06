% @author: Armando Salazar
% @date: 03-11-23


clc, clear
%for var = inicio:fin
%for var = inicio:incremento:fin
values_t = zeros(1,50);
values_x = zeros(1,50);
values_y = zeros(1,50);
% vector = [2, 3, 2]; % vector de proyección
% vector = [1, 3, 30]; % vector de proyección: el vector de proyección
vector = [0, 3, 30]; % vector de proyección: el vector de proyección


inc = 8 * pi / 50;
i = 1;
for t=0:inc:8*pi
    % fprintf('%f\n', t);
    % values_t = [values_t, t]; % añadir al final
    % parametricas
    % x = x_1 + x_p * u = -z_1/z_p
    % y = y_1 + y_p * u = -z_1/z_p
    % z = z_1 + z_p * u = -z_1/z_p
    u = -t/vector(3);
    x = cos(t) + vector(1)*u;
    y = sin(t) + vector(2)*u;
    % z = t + vector(3)*u;

    values_t(i) = t;
    values_x(i) = x;
    values_y(i) = y;

    % values_t(i) = t;
    % values_x(i) = cos(t);
    % values_y(i) = sin(t);
    i = i +1;
end
clear u vector x y z
clear i inc t
table = table(values_t', values_x', values_y', values_t', 'VariableNames', {'t', 'x', 'y', 'z'});
clear values_t values_x values_y
writetable(table, 'graphics/nombre_archivo.xlsx', 'Sheet','Hoja1');
% clear table
plot(table.x, table.y);
axis equal
fprintf('Successfully!!\n\n');