% @autor: Armando Salazar
% @date: 06-11-23

clear, clc

projection_vector = [1,5,3];
points = [
    3,2,2;
    3,4,3;
    5,2,2;
    5,4,3;
    2,3,2;
    2,5,4;
    4,3,2;
    4,5,4];

% Calcula la proyección de los puntos
u = -points(:, 3) ./ projection_vector(3); % con el punto le aplico a cada elemento una operación en lugar de todo a toda la matriz
points(:, 1) = points(:, 1) + projection_vector(1) * u;
points(:, 2) = points(:, 2) + projection_vector(2) * u;
points(:, 3) = nan;
clear u projection_vector

projected_table = array2table(points, 'VariableNames', {'X', 'Y', 'Z'});
clear points
plot(projected_table.X, projected_table.Y);
axis equal

% plot3(points(:,1), points(:,2), points(:,3));
% axis equal