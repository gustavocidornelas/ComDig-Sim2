function [ bits ] = genBits(length)
%% Fun��o genBits(n) 
% Gera n bits aleat�rios com mesma probabilidade de 0s e 1s. 
% Exemplo:[bits] = genBits(4)
%           bits = [1 1 0 0]
%% Gera��o dos bits aleat�rios
bits = randi([0, 1], 1, length); 

end

