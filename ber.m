function [ BER ] = ber( bits, estimatedBits )
%% Fun��o errors()
% Fun��o que calcula a quantidade de erros em duas sequ�ncias de bits
%% C�lculo da quantidade de erros
numErrors = 0;

for i=1:1:length(bits)
    if bits(i) ~= estimatedBits(i) % Se o bit recebido � diferente do bit estimado
        numErrors = numErrors + 1; % Mais um erro � contabilizado
    end
end

BER = numErrors/length(bits);

end

