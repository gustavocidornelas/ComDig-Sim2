function [ estimatedBits ] = DeMapperQPSK( estimatedSymbols, compareVector )
%% Função DeMapperQPSK()
% Faz a transformação dos símbolos em bits, onde:
%   s1 = sqrt(Es/2)*exp(1i*pi/4) -> 00 
%   s2 = sqrt(Es/2)*exp(1i*3*pi/4) -> 01 
%   s3 = sqrt(Es/2)*exp(-1i*3*pi/4) -> 11 
%   s4 = sqrt(Es/2)*exp(-1i*pi/4) -> 10 

%% Percorrendo o vetor de símbolos estimados
estimatedBits = zeros(length(estimatedSymbols), 2);


for i = 1:1:length(estimatedSymbols)
    currentSymbol = estimatedSymbols(i); % Símbolo atual
    
    if currentSymbol == compareVector(1)
        estimatedBits(i, :) = [0 0];
    
    elseif currentSymbol == compareVector(2)
        estimatedBits(i, :) = [0 1];
    
    elseif currentSymbol == compareVector(3)
        estimatedBits(i, :) = [1 1];
    
    elseif currentSymbol == compareVector(4)
        estimatedBits(i, :) = [1 0];
    end
    
end

estimatedBits = estimatedBits';
estimatedBits = estimatedBits(:)';

end

