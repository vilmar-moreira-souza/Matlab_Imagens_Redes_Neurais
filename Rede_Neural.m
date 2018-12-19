clc;%limpa tela 
clear all;%limpa variaveis
%binarização das imagens 2 imagens de entrada
img = rgb2gray(imread('quadro1.png'));
img1 = im2bw(img);
img2=vec2mat(img1,1049856);

img = rgb2gray(imread('quadro2.png'));
img1 = im2bw(img);
img3=vec2mat(img1,1049856);

%imagem de saida padrao/obejetivo
img = rgb2gray(imread('quadro.png'));%Tons de cinza
img1 = im2bw(img);%binario unica camada
img4=vec2mat(img1,1049856);%converte em lihna com 768x1367=1049856, recomendavel usar imagens menores(50x50) 
%EXECUÇAO------------------------------------------------------------------------------------------
entrada = [img2;img3];%dados de entrada / 2 imagens convertidas em linha
padrao =  img4; % dados desejados de saida-alvo /1 imagem convertida em linha
co= 3;%camada oculta
net = newff(entrada, padrao,co);%inicializa a rede 
net = train(net,entrada,padrao);%treinamento da rede

quadrado = sim(net,entrada);%testando a rede neural
quadrado = uint8(quadrado);%transforma em inteiro


%-------------COMPARAÇÃO -------------------
%   QUADRADO
if(quadrado== img4)
    disp('quadrado');
else
    disp('nao e quadrado');
end
