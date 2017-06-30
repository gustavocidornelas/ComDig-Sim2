function [ receivedSignal ] = AWGNChannel( symbols, N0 )
%% Fun��o AWGNChannel()
% Adiciona um ru�do Gaussiano branco complexo com vari�ncia N0 na sequ�ncia
% de s�mbolos sendo enviados.

%% Desvio padr�o em cada componente (real e imagin�ria)

noise = sqrt(N0/2).*randn(1, length(symbols)) + (1i)*sqrt(N0/2).*randn(1, length(symbols));

%% Sinal recebido

receivedSignal = symbols + noise;

end

