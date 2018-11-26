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
net = newff(minmax(P),[5 1],{'tansig' 'logsig'});
net.trainParam.epochs =100;


net = train(net,entrada,padrao);%treina a net 

figure
y= sim(net, entrada);
plot(entrada, padrao,entrada, y,'o');


