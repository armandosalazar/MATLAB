% @autor: Armando Salazar
% @date: 07-11-23

clear, clc
vector = [2 2 5];
% x, y, z
points = [
    1 1 1;
    1 3 1;
    3 1 1;
    3 3 1;
    1 1 3;
    1 3 3;
    3 1 3;
    3 3 3];

for i=1:size(points,1)
    u = points(i,3) / (vector(3) - points(i,3));
    points(i,1)=vector(1)+(points(i,1)-vector(1))*u;
    points(i,2)=vector(2)+(points(i,2)-vector(2))*u;
    points(i,3)=0;
    fprintf('x:%.2f\ty:%.2f\tu:%.2f\n', points(i,1), points(i,2), u);
end

clear i u vector

x = points(:,1);
y = points(:,2);

table = table(x, y, 'VariableNames', {'x', 'y'});



clear points

plot(x, y, 'o')

xlabel('Eje X')
ylabel('Eje Y')

title('Gráfica de puntos')

grid on

axis equal
xlim([-max(abs(x)), max(abs(x))]);
ylim([-max(abs(y)), max(abs(y))]);

% Añadir etiquetas a cada punto
for i = 1:length(x)
    % text(x(i), y(i), sprintf('(%d, %d)', round(x(i)), round(y(i))), 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
    text(x(i), y(i), sprintf('(%.2f, %.2f)', x(i), y(i)), 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
end

clear i
