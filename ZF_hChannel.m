function [ equalizedSignal ] = ZF_hChannel( receivedSignal )
%% Função ZF_hChannel()
% Realiza a equalização zero-forcing (ZF) para o canal h[k], cuja resposta
% impulsional em tempo discreto é dada por:
% h[k] = (1/sqrt(2))*delta[k] + (j/2)*delta[k-1] - (1/2)*delta[k-2]

%% Resposta em frequência do canal h[k]
h = [(1/sqrt(2)), (1i/2), (-1/2)]; % Resposta impulsional do canal

H = fft(h); % Resposta em frequência do canal h[k]

%% Sinal recebido no domínio da frequência
Y = fft(receivedSignal); 

%% Equalização zero-forcing (ZF)
ZF = 1./H;
ZF = [ZF, zeros(1, length(receivedSignal)-3)]; % Completando com zeros para que fique do tamanho de Y

equalizedSignalinFrequency = Y.*ZF; % Equalização no domínio da frequência

equalizedSignal = ifft(equalizedSignalinFrequency);



end

