
clc; clear; close all;
%% prueba de Automata celular usando imagen lena
[X,Map] = imread('LENA1.BMP');
%% realizar la binarizacion de la imagen
I_bin=imbinarize(X);

figure (1),subplot(1,3,1),imshow(I_bin),title('IMAGEN ORIGINAL BINARIZADA')
%% obtener un vector de toda la imagen
we=I_bin(:);
%% obtener el tamaño de la imagen original
t=size(I_bin);
P_1=I_bin;
K=1;

for i=1:K
    we = encoder_R150_Circular_list(we);
end 


aux1= reshape(we,[t(1),t(2)]);
figure (1),subplot(1,3,2),imshow(aux1),title('IMAGEN Resultante')

wd=we;
for i=1:K
    wd = decoder_R167_Circular_list(wd);
end 

aux= reshape(wd,[t(1),t(2)]);
figure (1),subplot(1,3,3),imshow(aux),title('IMAGEN INVERSA')

a=ssim(uint8(P_1),uint8(aux))
b=psnr(uint8(P_1),uint8(aux))


%%NOTAS:
%% AL HACER USO DE LAS LISTAS LIGADAS Y una sola regla 15 para el movimiento de los automatas, se observa lo siguinte:

%%Al tener K impar se obtiene el negativo de la imagen binarizada
%%Al tener K par se ontiene la imagen binarizada

%% Al tener mas de 3 movimientos la imagen empieza a rotar por hacer uso de la lista circular
%% Al hacer mas de 100 rondas la imagen se comienza  a deplazar hacia abajo






