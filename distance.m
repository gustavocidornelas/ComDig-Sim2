function [ d ] = distance( s1, s2 )
%% Fun��o distance()
% Calcula a dist�ncia d entre dois sinais (com base na constela��o)

%% C�lculo da dist�ncia
d = sqrt((real(s1) - real(s2))^2 + (imag(s1) - imag(s2))^2);

end

