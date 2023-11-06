% @author: Armando Salazar
% @date: 05-10-23

clc, clear

mobiledevlist;
m = mobiledev('iPhone - iPhone de Armando');

cam = camera(m);
img = snapshot(cam, 'immediate');

imwrite(img, 'nombre_imagen.jpg');