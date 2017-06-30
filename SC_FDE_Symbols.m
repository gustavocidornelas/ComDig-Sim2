function [ scSymbol ] = SC_FDE_Symbols( symbols, N, G )
%% Fun��o SC_FDE()
% Fun��o que simula um sistema SC FDE (single carrier frequency domain
% equalization), com possibilidade de se realizar a equaliza��o ZF ou MMSE.
% Blocos de N s�mbolos e com G s�mbolos de prefixo c�clico.

%% Divis�o dos s�mbolos em blocos de N elementos
block = (reshape(symbols, N, length(symbols)/N)).'; % Cada linha � um bloco com N s�mbolos

%% Adi��o do prefixo c�clico de G s�mbolo
CP = block(:, N - G + 1:N); % Separa��o do prefixo c�clico
scSymbol = [CP, block];  % Concatena��o dos blocos com o CP

scSymbol = scSymbol.';
scSymbol = scSymbol(:).'; 

end

