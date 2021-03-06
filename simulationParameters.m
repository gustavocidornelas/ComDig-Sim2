function [ scenario, numBits, MaxEb_N0_dB,N0, BER, N, G  ] = simulationParameters(  )
%% Fun��o simulationParameters()
% Fun��o para o carregamento de todos os par�metros para a simula��o em
% quest�o. Pela edi��o desta fun��o, escolhem-se:
%      - O cen�rio simulado
%      - A quantidade de bits enviados
%      - Quais valores de Eb/N0 s�o avaliados
%      - Par�metros do SC-FDE

%% Escolha do cen�rio simulado: canal e equaliza��o
% Escolha feita a partir do valor da vari�vel scenario. 
%       scenario = 1: Canal AWGN
%       scenario = 2: Canal h[k] = (1/sqrt(2))*delta[k] + (j/2)*delta[k-1] - (1/2)*delta[k-2] sem equaliza��o
%       scenario = 3: SC-FDE com canal h[k] e equaliza��o ZF
%       scenario = 4: SC-FDE com canal h[k] e equaliza��o MMSE
scenario = 4; 

if scenario ~= 1 && scenario ~= 2 && scenario ~= 3 && scenario ~= 4
    display('Erro! O valor de scenario deve ser de 1, 2 3 ou 4. Ler descri��o em simulationParameters() para mais informa��es.')
end

%% Escolha da quantidade de bits enviados
numBits = 10^5;

%% Escolha dos valores de Eb/N0 simulados
MaxEb_N0_dB = 12; % Valor m�ximo de Eb/N0 em dB (simula��o de 0 dB at� MaxEb_N0_dB)

Eb = 1/2; % Para que Es = 1
Eb_N0_dB = [0:MaxEb_N0_dB]; % Vetor de Eb/N0
Eb_N0_lin = 10.^(Eb_N0_dB/10); % Eb/N0 em W
N0 = Eb./(Eb_N0_lin); % Vetor com os valores de N0 em W/Hz

BER = zeros(1, MaxEb_N0_dB); % Vetor que armazena as taxas de erro de bit para cada Eb/N0

%% Escolha dos par�metros do SC-FDE
% N: quantidade de s�mbolos por bloco
% G: tamanho do prefixo c�clico
% CUIDADO com a divisibilidade
G = 2; 
N = 16;

end

