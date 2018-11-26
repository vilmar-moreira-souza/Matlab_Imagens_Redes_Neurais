
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
%P = [0 1 0 1 ; 0 0 1 1 ];
%T = [0 0 0 1 ];
%net = newff([min(P')' max(P')'],[10 1],{'tansig' 'logsig'},'traingd');

net = newff([min(P')' max(P')'],[5 1],{'tansig' 'logsig'},'traingd');
net.trainParam.goal = 1e-8;
% Treina a rede iterativamente, de 5 em 5 epochs,
% até o total de 100 epochs, calculando os erros
Nepoch = 5;
NN = 20;
mape_min = 1e38;
for i = 1:NN,
net.trainParam.epochs = Nepoch;
net = train(net, Ptrain, Ttrain);
Ctrain = sim(net, Ptrain);
Cvalid = sim(net, Pvalid);
% Calcula os erros MAPE para os padrões de treinamento e validação
mape_train(i) = 100*mean(abs((Ttrain-Ctrain)./Ttrain))
mape_valid(i) = 100*mean(abs((Tvalid-Cvalid)./Tvalid))

if (mape_valid(i) < mape_min)
mape_min = mape_valid(i);
net_opt = net;
Noptim = Nepoch * i;
end
end
% Melhor rede:
net = net_opt;
% Testa a rede com os 3 conjuntos de padrões
Ctrain = sim(net, Ptrain);
Cvalid = sim(net, Pvalid);
Ctest = sim(net, Ptest);
