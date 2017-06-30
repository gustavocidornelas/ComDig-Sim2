%% Simulação 2 de ComDig - Universidade de Brasília
% Alunos: Caio Fábio, Gustavo Cid e Lucas Baião
%
% Julho de 2017

%% Parâmetros da simulação
[scenario, numBits, MaxEb_N0_dB,N0, BER, N, G] = simulationParameters();

%% Gerando os bits 
bits = genBits(numBits); % Vetor de bits
%bits = [0 0 0 1 1 0 1 1 0 0 0 1 1 0 1 1 0 0]; % teste

%% Mapeando a sequência de bits em símbolos QPSK
[symbols, compareVector] = MapperQPSK(bits, Eb); % Vetor de símbolos QPSK

%% Enviando a sequência de símboloso pelo canal e calculando a BER

for i = 0:1:MaxEb_N0_dB
    if scenario == 1 % QPSK no canal AWGN
       receivedSignal = AWGNChannel(symbols, N0(i+1)); % Sinal após o canal AWGN 
    
    elseif scenario == 2 % QPSK no canal h[k] sem equalização
        receivedSignal = hChannel(symbols, N0(i+1)); % Sinal após o canal h[k] com multipercursos
    
    elseif scenario == 3 % SC-FDE no canal h[k] com equalização ZF
        scSymbol = SC_FDE_Symbols(symbols, N, G); % Contrução dos símbolos SC-FDE
        
        receivedSignal = hChannel(scSymbol, N0(i+1)); % Sinal após o canal h[k] com multipercursos
        
        receivedSignal = SC_FDE_RemoveCP(receivedSignal, N, G); % Remoção do prefixo cíclico
        
        receivedSignal = ZF_hChannel(receivedSignal); % Equalização ZF para o canal h[k]
        
    elseif scenario == 4 % SC-FDE no canal h[k] com equalização MMSE
        scSymbol = SC_FDE_Symbols(symbols, N, G); % Contrução dos símbolos SC-FDE
        
        receivedSignal = hChannel(scSymbol, N0(i+1)); % Sinal após o canal h[k] com multipercursos
        
        receivedSignal = SC_FDE_RemoveCP(receivedSignal, N, G); % Remoção do prefixo cíclico
        
        receivedSignal = MMSE_hChannel(receivedSignal, i); % Equalização MMSE para o canal h[k]    
    end
    
    estimatedSymbols = decideSymbol(receivedSignal, compareVector); % Símbolos estimados

    estimatedBits = DeMapperQPSK(estimatedSymbols, compareVector); % Sequência de bits estimada
    
    BER(i+1) = ber(bits, estimatedBits); % Comparação entre os bits originais e os estimados
end

%% Plotando os resultados

plotResults(BER, Eb_N0_dB, scenario);

