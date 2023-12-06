% @autor: Armando Salazar
% @date: 06-11-23

clear, clc

projection_vector = [5 3 1];
points = [
    3 2 2;
    3 4 3;
    5 2 2;
    5 4 3;
    2 3 2;
    2 5 4;
    4 3 2;
    4 5 4];

% Calcula la proyección de los puntos
u = -points(:, 3) ./ projection_vector(3); % con el punto le aplico a cada elemento una operación en lugar de todo a toda la matriz
points(:, 1) = points(:, 1) + projection_vector(1) * u;
points(:, 2) = points(:, 2) + projection_vector(2) * u;
points(:, 3) = nan;
clear u projection_vector

projected_table = array2table(points, 'VariableNames', {'X', 'Y', 'Z'});

clear points

x = projected_table.X;
y = projected_table.Y;

plot(x, y, 'o')

grid on
axis equal

xlim([-max(abs(x)), max(abs(x))]);
ylim([-max(abs(y)), max(abs(y))]);

% Añadir etiquetas a cada punto
for i = 1:length(x)
    % text(x(i), y(i), sprintf('(%d, %d)', round(x(i)), round(y(i))), 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
    text(x(i), y(i), sprintf('(%d, %d)', x(i), y(i)), 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
end

clear i

% plot3(points(:,1), points(:,2), points(:,3));
% axis equal