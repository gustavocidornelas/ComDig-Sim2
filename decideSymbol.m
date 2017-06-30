function [ estimatedSymbols ] = decideSymbol( receivedSignal, compareVector )
%% Função decideSymbol()
% Com base no sinal recebido, estima-se o símbolo enviado, isto é,
% escolhe-se o símbolo com a menor distância do sinal recebido.

%% Cálculo das distâncias
distances = zeros(1, length(compareVector));
estimatedSymbols = zeros(1, length(receivedSignal));

for i = 1:1:length(receivedSignal)
    currentSignal = receivedSignal(i); % Sinal atual a ser comparado
    
    for k =  1:1:length(compareVector)
        currentVector = compareVector(k);
        distances(k) = distance(currentSignal, currentVector); % Distância do sinal recebido para todos os símbolos possíveis
    end
    
    [~, locMin] = min(distances); % Índice da menor distância entre o sinal recebido e os símbolos possíveis
    
    estimatedSymbols(i) = compareVector(locMin); % Símbolo estimado (aquele com a menor distância)
    
end



end

