% @autor: Armando Salazar
% @date: 07-11-23

clear, clc
vector = [2,2,5];
points = [
    1,1,1;
    1,3,1;
    3,1,1;
    3,3,1;
    1,1,3;
    1,3,3;
    3,1,3;
    3,3,3];

for i=1:size(points,1)
    u=-vector(3)/(points(i,3)-vector(3));
    points(i,1)=vector(1)+(points(i,1)-vector(1))*u;
    points(i,2)=vector(2)+(points(i,2)-vector(2))*u;
    points(i,3)=vector(3)+(points(i,3)-vector(3))*u;
    fprintf('x:%.2f\ty:%.2f\n', points(i,1), points(i,2));
end
plot(points(:,1),points(:,1));
axis equal