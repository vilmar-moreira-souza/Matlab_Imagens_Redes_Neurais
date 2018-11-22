%/EXEMPLOS
%Examples

%Here a perceptron is created, and then configured so that its input, output, weight, and bias dimensions match the input and target data.
clear all;
x = [0 1 0 1 ; 0 0 1 1 ];
t = [0 0 0 1 ];
net = perceptron;
net = configure(net,x,t);
net.iw{1,1}
net.b{1}
%Training the perceptron alters its weight and bias values.

net = train(net,x,t);
net.iw{1,1}
net.b{1}
%init reinitializes those weight and bias values.

net = init(net);
net.iw{1,1}
net.b{1}
%The weights and biases are zeros again, which are the initial values used by perceptron networks.
%EXEMPLO