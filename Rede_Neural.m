clc;
clear all;
%binarização das imagens
a = rgb2gray(imread('quadrado1.png'));
a1 = im2bw(a(:));
b = rgb2gray(imread('quadrado2.png'));
b1 = im2bw(b(:));
c = rgb2gray(imread('quadrado3.png'));
c1 = im2bw(c(:));
d = rgb2gray(imread('quadrado.png'));
d1 = im2bw(d(:));
entrada = [c1;a1;b1];%dados de entrada
padrao =  d1 ; % dados desejados de saida-alvo
net = perceptron; % inicia a net  
net.trainParam.goal = 1e-8; %erro final desejado
net = configure(net,entrada,padrao);% configura a net com os dados inseridos
net = train(net,entrada,padrao);%treina a net 
quadrado = sim(net,entrada); 


%------------------------------------------------------------------
%------------------------------------------------------------------
% circulo ---------------------------------------------------------


%binarização das imagens
A = rgb2gray(imread('circulo1.png'));
A1 = im2bw(A(:));
B = rgb2gray(imread('circulo2.png'));
B1 = im2bw(B(:));
C = rgb2gray(imread('circulo3.png'));
C1 = im2bw(C(:));
D = rgb2gray(imread('circulo.png'));
D1 = im2bw(D(:));
entrada = [A1;B1;C1];%dados de entrada
padrao =  D1 ; % dados desejados de saida-alvo
% Treina a net iterativamente, de 5 em 5 epochs,
Nepoch = 5;
NN = 20;
net.trainParam.goal = 1e-8; %erro final desejado
rede = perceptron; % inicia a net  
rede = configure(rede,entrada,padrao);% configura a net com os dados inseridos
rede = train(rede,entrada,padrao);%treina a net 
circulo = sim(rede,entrada); 


%-------------COMPARAÇÃO -------------------
%   QUADRADO
if(quadrado == d1)
    disp('quadrado');
else
    disp('nao e quadrado');
end
%   CIRCULO
if(circulo == D1)
    disp('circulo');
else
    disp('nao e circulo');
end




