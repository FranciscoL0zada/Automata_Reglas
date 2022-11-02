
clc; clear; close all;
%% prueba de Automata celular usando imagen lena
[X,Map] = imread('LENA1.BMP');
%% realizar la binarizacion de la imagen
I_bin=imbinarize(X);
figure();imshow(I_bin);
%% obtener un vector de toda la imagen
we=I_bin(:);
%% obtener el tamaño de la imagen original
t=size(I_bin);

k=3

for i=1:7
    we = encoder_R15(we);
end 


aux1= reshape(we,[t(1),t(2)]);
figure();imshow(aux1);


wd=we;
for i=1:7
    wd = decoder_R85(wd);
end 

aux= reshape(wd,[t(1),t(2)]);
figure();imshow(aux);





% W=[1,1,1,0,1,1,1,0,1,1,1,1]
% we = encoder_R15(W);
% we = encoder_R15(we)
% 
% wd = decoder_R85(we);
% wd = decoder_R85(wd)


