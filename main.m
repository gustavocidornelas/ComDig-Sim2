%% Simula��o 2 de ComDig - Universidade de Bras�lia
% Alunos: Caio F�bio, Gustavo Cid e Lucas Bai�o
%
% Julho de 2017

%% Par�metros da simula��o
[scenario, numBits, MaxEb_N0_dB,N0, BER, N, G] = simulationParameters();

%% Gerando os bits 
bits = genBits(numBits); % Vetor de bits
%bits = [0 0 0 1 1 0 1 1 0 0 0 1 1 0 1 1 0 0]; % teste

%% Mapeando a sequ�ncia de bits em s�mbolos QPSK
[symbols, compareVector] = MapperQPSK(bits, Eb); % Vetor de s�mbolos QPSK

%% Enviando a sequ�ncia de s�mboloso pelo canal e calculando a BER

for i = 0:1:MaxEb_N0_dB
    if scenario == 1 % QPSK no canal AWGN
       receivedSignal = AWGNChannel(symbols, N0(i+1)); % Sinal ap�s o canal AWGN 
    
    elseif scenario == 2 % QPSK no canal h[k] sem equaliza��o
        receivedSignal = hChannel(symbols, N0(i+1)); % Sinal ap�s o canal h[k] com multipercursos
    
    elseif scenario == 3 % SC-FDE no canal h[k] com equaliza��o ZF
        scSymbol = SC_FDE_Symbols(symbols, N, G); % Contru��o dos s�mbolos SC-FDE
        
        receivedSignal = hChannel(scSymbol, N0(i+1)); % Sinal ap�s o canal h[k] com multipercursos
        
        receivedSignal = SC_FDE_RemoveCP(receivedSignal, N, G); % Remo��o do prefixo c�clico
        
        receivedSignal = ZF_hChannel(receivedSignal); % Equaliza��o ZF para o canal h[k]
        
    elseif scenario == 4 % SC-FDE no canal h[k] com equaliza��o MMSE
        scSymbol = SC_FDE_Symbols(symbols, N, G); % Contru��o dos s�mbolos SC-FDE
        
        receivedSignal = hChannel(scSymbol, N0(i+1)); % Sinal ap�s o canal h[k] com multipercursos
        
        receivedSignal = SC_FDE_RemoveCP(receivedSignal, N, G); % Remo��o do prefixo c�clico
        
        receivedSignal = MMSE_hChannel(receivedSignal, i); % Equaliza��o MMSE para o canal h[k]    
    end
    
    estimatedSymbols = decideSymbol(receivedSignal, compareVector); % S�mbolos estimados

    estimatedBits = DeMapperQPSK(estimatedSymbols, compareVector); % Sequ�ncia de bits estimada
    
    BER(i+1) = ber(bits, estimatedBits); % Compara��o entre os bits originais e os estimados
end

%% Plotando os resultados

plotResults(BER, Eb_N0_dB, scenario);

