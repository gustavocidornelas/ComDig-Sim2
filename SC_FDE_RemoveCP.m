function [ receivedSignalNoCP ] = SC_FDE_RemoveCP( receivedSignal, N, G )
%% Fun��o SC_FDE_RemoveCP
% Fun��o que remove o prefixo c�clico do sinal recebido.

%% Removendo o prefixo c�clico   
receivedSignalNoCP = (reshape(receivedSignal, N+G, length(receivedSignal)/(N+G))).'; % Cada linha equivale a um s�mbolo SC-FDE
    
receivedSignalNoCP = receivedSignalNoCP(:, G+1:size(receivedSignalNoCP, 2)); % Removendo o CP

receivedSignalNoCP = receivedSignalNoCP.';
receivedSignalNoCP = receivedSignalNoCP(:).';


end

