function [ bits ] = genBits(length)
%% Função genBits(n) 
% Gera n bits aleatórios com mesma probabilidade de 0s e 1s. 
% Exemplo:[bits] = genBits(4)
%           bits = [1 1 0 0]
%% Geração dos bits aleatórios
bits = randi([0, 1], 1, length); 

end

