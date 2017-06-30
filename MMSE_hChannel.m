function [ equalizedSignalInTime ] = MMSE_hChannel( receivedSignal, Eb_N0_dB )
%% Fun��o MMSE_hChannel()
% Realiza a equaliza��o minimum mean square error (MMSE) para o SC-FDE no
% canal h[k] cuja resposta impulsional em tempo discreto � dada por:
% h[k] = (1/sqrt(2))*delta[k] + (j/2)*delta[k-1] - (1/2)*delta[k-2]

%% Es/N0 
Eb_N0_lin = 10^(Eb_N0_dB/10); % Eb/N0 em escala linear
Es_N0_lin = 2*Eb_N0_lin; % Es/N0 em escala linear

%% Resposta em frequ�ncia do canal h[k]
h = [(1/sqrt(2)), (1i/2), (-1/2)]; % Resposta impulsional do canal

H = fft(h); % Resposta em frequ�ncia do canal h[k]

%% Sinal recebido no dom�nio da frequ�ncia
Y = fft(receivedSignal); 

%% Equaliza��o MMSE
MMSE = conj(H)./(abs(H).^2 + 1/Es_N0_lin);
MMSE = [MMSE, zeros(1, length(receivedSignal)-3)]; % Completando o vetor MMSE com zeros

equalizedSignalInFrequency = Y.*MMSE; % Equaliza��o MMSE no dom�nio da frequ�ncia

equalizedSignalInTime = ifft(equalizedSignalInFrequency);
end

