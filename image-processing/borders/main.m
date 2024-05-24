clear; clc; close all;

I = imread(cat(2, pwd, '/input/you.jpeg'));
IHome = imread(cat(2, pwd, '/input/home.png'));

IGray = I(:, :, 1) / 3 + I(:, :, 2) / 3 + I(:, :, 3) / 3;
IHomeGray = IHome(:, :, 1) / 3 + IHome(:, :, 2) / 3 + IHome(:, :, 3) / 3;

ISobel = sobel(IGray);

figure;
subplot(1, 2, 1);
imshow(IGray);
title('Original Image');
subplot(1, 2, 2);
imshow(ISobel);
title('Sobel Image');

IPrewitt = prewitt(IGray);

figure;
subplot(1, 2, 1);
imshow(IGray);
title('Original Image');
subplot(1, 2, 2);
imshow(IPrewitt);
title('Prewitt Image');

IRoberts = roberts(IGray);

figure;
subplot(1, 2, 1);
imshow(IGray);
title('Original Image');
subplot(1, 2, 2);
imshow(IRoberts);
title('Roberts Image');

ICanny = canny(IGray);

figure;
subplot(1, 2, 1);
imshow(IGray);
title('Original Image');
subplot(1, 2, 2);
imshow(ICanny);
title('Canny Image');

harris(IHomeGray);

function I = sobel(I)
	[m, n, ~] = size(I);
	I = double(I);
	gy = zeros(m, n);
	gx = zeros(m, n);
	for r=2:m-1
		for c=2:n-1
			gx(r, c) = -1 * I(r-1, c-1) - 2 * I(r-1, c) - I(r-1, c+1)...
				+ I(r+1, c-1) + 2 * I(r+1, c) + I(r+1, c+1);
			gy(r, c) = -1 * I(r-1, c-1) + I(r-1, c+1)...
				- 2 * I(r, c-1) + 2 * I(r, c+1)...
				- I(r+1, c-1) + I(r+1, c+1);
		end
	end
	% I = sqrt(gx.^2 + gy.^2);
	% I = uint8(I);
	gt = sqrt(gx.^2 + gy.^2);
	vMaxGt = max(max(gt));
	gtNormalized = (gt / vMaxGt) * 255;
	I = uint8(gtNormalized);
	B = I > 100;

	vMinGx = min(min(gx));
	vMinGy = min(min(gy));

	gradOffX = gx - vMinGx;
	gradOffY = gy - vMinGy;

	vMaxGx = max(max(gradOffX));
	vMaxGy = max(max(gradOffY));

	gxNormalized = (gradOffX / vMaxGx) * 255;
	gyNormalized = (gradOffY / vMaxGy) * 255;
end

function I = prewitt(I)
	[m, n, ~] = size(I);
	I = double(I);
	gy = zeros(m, n);
	gx = zeros(m, n);
	for r=2:m-1
		for c=2:n-1
			gx(r, c) = -1 * I(r-1, c-1) - I(r-1, c) - I(r-1, c+1)...
				+ I(r+1, c-1) + I(r+1, c) + I(r+1, c+1);
			gy(r, c) = -1 * I(r-1, c-1) + I(r-1, c+1)...
				- I(r, c-1) + I(r, c+1)...
				- I(r+1, c-1) + I(r+1, c+1);
		end
	end
	I = sqrt(gx.^2 + gy.^2);
	I = uint8(I);
end

function I = roberts(I)
	[m, n, ~] = size(I);
	I = double(I);
	gy = zeros(m, n);
	gx = zeros(m, n);
	for r=2:m-1
		for c=2:n-1
			gx(r, c) = I(r, c) - I(r+1, c+1);
			gy(r, c) = I(r+1, c) - I(r, c+1);
		end
	end
	I = sqrt(gx.^2 + gy.^2);
	I = uint8(I);
end

function I = canny(I)
	[m, n, ~] = size(I);
	I = double(I);
	gy = zeros(m, n);
	gx = zeros(m, n);
	for r=2:m-1
		for c=2:n-1
			gx(r, c) = -1 * I(r-1, c-1) - 2 * I(r-1, c) - I(r-1, c+1)...
				+ I(r+1, c-1) + 2 * I(r+1, c) + I(r+1, c+1);
			gy(r, c) = -1 * I(r-1, c-1) + I(r-1, c+1)...
				- 2 * I(r, c-1) + 2 * I(r, c+1)...
				- I(r+1, c-1) + I(r+1, c+1);
		end
	end
	I = sqrt(gx.^2 + gy.^2);
	I = uint8(I);
end

function [] = harris(Ir)
[m, n, ~]=size(Ir);

S = zeros(size(Ir));

h = ones(3,3)/9;
Id = double(Ir);
If = imfilter(Id,h);

% Gradiente horizontal Hx y vertical Hy
Hx=[-0.5 0 0.5];
Hy=[-0.5;0;0.5];

Ix=imfilter(If,Hx);
Iy=imfilter(If,Hy);

% Coeficientes de la matriz de estructuras
HE11=Ix.*Ix;
HE22=Iy.*Iy;
HE12=Ix.*Iy;

%Se crea la matriz del filtro Gaussiano
Hg=[0 1 2 1 0; 1 3 5 3 1;2 5 9 5 2;1 3 5 3 1;0 1 2 1 0];
Hg=Hg*(1/57);

%Se filtran los coeficientes de la matriz de estructuras con el filtro Gaussiano
A=imfilter(HE11,Hg);
B=imfilter(HE22,Hg);
C=imfilter(HE12,Hg);

alfa=0.04;

% Magnitud del valor de la esquina
Rp=A+B; 
Rp1=Rp.*Rp; 

%Valor de la esquina 
Q=((A.*B)-(C.*C))-(alfa*Rp1);

%Se obtiene la matriz U 
th=1000;
U=Q>th;
pixel=8;

%Se obtiene el valor mas grande de Q
for r=1:m
    for c=1:n
        if(U(r,c))
            I1=[r-pixel 1];
            I2=[r+pixel m];
            I3=[c-pixel 1];
            I4=[c+pixel n];
            datxi=max(I1);
            datxs=min(I2);
            datyi=max(I3);
            datys=min(I4);
            Bloc=Q(datxi:1:datxs,datyi:1:datys);
            MaxB=max(max(Bloc));
            if(Q(r,c)==MaxB)
                S(r,c)=1;
            end
        end
    end
end

%Se mantiene el objeto grafico 
figure;
imshow(Ir);
hold on

%Se grafican sobre la imagen Ir las esquinas calculadas por el algoritmo de Harris 
for r=1:m
    for c=1:n
        if(S(r,c))
            plot(c,r,'+');
        end
    end
end
end
