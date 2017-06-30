function [ receivedSignal ] = hChannel( symbols, N0 )
%% Fun��o hChannel()
% Simula o canal com multipercursos descrito pela resposta impulsional em tempo discreto:
% h[k] = (1/sqrt(2))*delta[k] + (j/2)*delta[k-1] - (1/2)*delta[k-2]

%% Defini��o da resposta impulsional em tempo discreto
h = [(1/sqrt(2)), (1i/2), (-1/2)];

%% Desvio padr�o em cada componente (real e imagin�ria)

noise = sqrt(N0/2).*randn(1, length(symbols)) + (1i)*sqrt(N0/2).*randn(1, length(symbols));

%% Sinal recebido
receivedSignal = conv(symbols, h);

receivedSignal = receivedSignal(1, 1:length(receivedSignal)-2);
receivedSignal = receivedSignal + noise;

end

