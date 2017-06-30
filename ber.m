function [ BER ] = ber( bits, estimatedBits )
%% Função errors()
% Função que calcula a quantidade de erros em duas sequências de bits
%% Cálculo da quantidade de erros
numErrors = 0;

for i=1:1:length(bits)
    if bits(i) ~= estimatedBits(i) % Se o bit recebido é diferente do bit estimado
        numErrors = numErrors + 1; % Mais um erro é contabilizado
    end
end

BER = numErrors/length(bits);

end

