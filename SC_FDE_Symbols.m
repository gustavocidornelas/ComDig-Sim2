function [ scSymbol ] = SC_FDE_Symbols( symbols, N, G )
%% Função SC_FDE()
% Função que simula um sistema SC FDE (single carrier frequency domain
% equalization), com possibilidade de se realizar a equalização ZF ou MMSE.
% Blocos de N símbolos e com G símbolos de prefixo cíclico.

%% Divisão dos símbolos em blocos de N elementos
block = (reshape(symbols, N, length(symbols)/N)).'; % Cada linha é um bloco com N símbolos

%% Adição do prefixo cíclico de G símbolo
CP = block(:, N - G + 1:N); % Separação do prefixo cíclico
scSymbol = [CP, block];  % Concatenação dos blocos com o CP

scSymbol = scSymbol.';
scSymbol = scSymbol(:).'; 

end

