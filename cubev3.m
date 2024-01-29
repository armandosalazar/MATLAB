% @autor: Armando Salazar
% @date: 27-11-23

clear, clc
center = [2 2 5];

points = [
    1 1 1;
    1 3 1;
    3 1 1;
    3 3 1;
    1 1 3;
    1 3 3;
    3 1 3;
    3 3 3];
u = - center(3) ./ (points(:,3) - center(3));
points(:,1) = center(1) + (points(:,1) - center(1)) .* u;
points(:,2) = center(2) + (points(:,2) - center(2)) .* u;

clear u

x = points(:,1);
y = points(:,2);

plot(x, y, 'o')

grid on
axis equal
xlim([-max(abs(x)), max(abs(x))]);
ylim([-max(abs(y)), max(abs(y))]);

for i = 1:length(x)
    % text(x(i), y(i), sprintf('(%d, %d)', round(x(i)), round(y(i))), 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
    text(x(i), y(i), sprintf('(%.2f, %.2f)', x(i), y(i)), 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
end

clear i x y

temp = points;

points(:,1) .* 2;

plot(points(:,1), points(:,2));