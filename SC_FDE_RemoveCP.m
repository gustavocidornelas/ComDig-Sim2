function [ receivedSignalNoCP ] = SC_FDE_RemoveCP( receivedSignal, N, G )
%% Função SC_FDE_RemoveCP
% Função que remove o prefixo cíclico do sinal recebido.

%% Removendo o prefixo cíclico   
receivedSignalNoCP = (reshape(receivedSignal, N+G, length(receivedSignal)/(N+G))).'; % Cada linha equivale a um símbolo SC-FDE
    
receivedSignalNoCP = receivedSignalNoCP(:, G+1:size(receivedSignalNoCP, 2)); % Removendo o CP

receivedSignalNoCP = receivedSignalNoCP.';
receivedSignalNoCP = receivedSignalNoCP(:).';


end

