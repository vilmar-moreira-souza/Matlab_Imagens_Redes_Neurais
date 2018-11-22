
clear all;
a = imread('quadrado1.png');
a1 = im2bw(a(:));
b = imread('quadrado2.png');
b1 = im2bw(b(:));
c = imread('quadrado3.png');
c1 = im2bw(c(:));
d = imread('quadrado.png');
d1 = im2bw(d(:));
P = [a1;b1;c1];

T = [ d1 ]; 
%P = [0 1 0 1 ; 0 0 1 1 ];
%T = [0 0 0 1 ];
%net = newff([min(P')' max(P')'],[10 1],{'tansig' 'logsig'},'traingd');


net = perceptron;
net = configure(net,P,T);
net.iw{1,1}
net.b{1}
net.trainParam.goal = 1e-8;
% Treina a rede iterativamente, de 5 em 5 epochs,
% até o total de 100 epochs, calculando os erros
Nepoch = 5;
NN = 20;
mape_min = 1e38;
for i = 1:NN,
 net.trainParam.epochs = Nepoch;
 net = train(net, P, T);

 Ctrain = sim(net, P);
 Cvalid = sim(net, P);
 % Calcula os erros MAPE para os padrões de treinamento e validação
 mape_train(i) = 100*mean(abs((Ttrain-Ctrain)./Ttrain))
 mape_valid(i) = 100*mean(abs((Tvalid-Cvalid)./Tvalid))

 % encontra o número de epochs ótimo
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

