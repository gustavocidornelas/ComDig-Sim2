function [ receivedSignal ] = AWGNChannel( symbols, N0 )
%% Função AWGNChannel()
% Adiciona um ruído Gaussiano branco complexo com variância N0 na sequência
% de símbolos sendo enviados.

%% Desvio padrão em cada componente (real e imaginária)

noise = sqrt(N0/2).*randn(1, length(symbols)) + (1i)*sqrt(N0/2).*randn(1, length(symbols));

%% Sinal recebido

receivedSignal = symbols + noise;

end

