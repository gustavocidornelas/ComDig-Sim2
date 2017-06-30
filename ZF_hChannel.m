function [ equalizedSignal ] = ZF_hChannel( receivedSignal )
%% Fun��o ZF_hChannel()
% Realiza a equaliza��o zero-forcing (ZF) para o canal h[k], cuja resposta
% impulsional em tempo discreto � dada por:
% h[k] = (1/sqrt(2))*delta[k] + (j/2)*delta[k-1] - (1/2)*delta[k-2]

%% Resposta em frequ�ncia do canal h[k]
h = [(1/sqrt(2)), (1i/2), (-1/2)]; % Resposta impulsional do canal

H = fft(h); % Resposta em frequ�ncia do canal h[k]

%% Sinal recebido no dom�nio da frequ�ncia
Y = fft(receivedSignal); 

%% Equaliza��o zero-forcing (ZF)
ZF = 1./H;
ZF = [ZF, zeros(1, length(receivedSignal)-3)]; % Completando com zeros para que fique do tamanho de Y

equalizedSignalinFrequency = Y.*ZF; % Equaliza��o no dom�nio da frequ�ncia

equalizedSignal = ifft(equalizedSignalinFrequency);



end

