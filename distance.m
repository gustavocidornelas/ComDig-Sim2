function [ d ] = distance( s1, s2 )
%% Função distance()
% Calcula a distância d entre dois sinais (com base na constelação)

%% Cálculo da distância
d = sqrt((real(s1) - real(s2))^2 + (imag(s1) - imag(s2))^2);

end

