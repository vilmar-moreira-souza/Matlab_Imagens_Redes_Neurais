a = imread('quadrado1.png');
a1 = im2bw(a(:));
b = imread('quadrado2.png');
b1 = im2bw(b(:));
c = imread('quadrado3.png');
c1 = im2bw(c(:));
d = imread('quadrado.png');
d1 = im2bw(d(:));
entrada = [a1;b1];

padrao = [ d1 ]; 
%entrada =[0 1 0 1 ; 0 0 1 1 ]; %dados de entrada
%padrao = [0 0 0 1 ];% dados desejados de saida-alvo
rede = perceptron; % inicia a rede  
view(rede);% mostra rede ainda vazia
rede = configure(rede,entrada,padrao);% configura a rede com os dados inseridos
view(rede);% mostra rede com os valores
rede = train(rede,entrada,padrao);%treina a rede 
%a = rede(input); % mostra valor treinado pela rede(com erro)
view(rede);