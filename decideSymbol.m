function [ estimatedSymbols ] = decideSymbol( receivedSignal, compareVector )
%% Fun��o decideSymbol()
% Com base no sinal recebido, estima-se o s�mbolo enviado, isto �,
% escolhe-se o s�mbolo com a menor dist�ncia do sinal recebido.

%% C�lculo das dist�ncias
distances = zeros(1, length(compareVector));
estimatedSymbols = zeros(1, length(receivedSignal));

for i = 1:1:length(receivedSignal)
    currentSignal = receivedSignal(i); % Sinal atual a ser comparado
    
    for k =  1:1:length(compareVector)
        currentVector = compareVector(k);
        distances(k) = distance(currentSignal, currentVector); % Dist�ncia do sinal recebido para todos os s�mbolos poss�veis
    end
    
    [~, locMin] = min(distances); % �ndice da menor dist�ncia entre o sinal recebido e os s�mbolos poss�veis
    
    estimatedSymbols(i) = compareVector(locMin); % S�mbolo estimado (aquele com a menor dist�ncia)
    
end



end

