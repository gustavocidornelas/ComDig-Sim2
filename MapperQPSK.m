function [ symbols, compareVector ] = MapperQPSK( bits, Eb )
%% Fun��o MapperQPSK() 
% Realiza o mapeamento de uma sequ�ncia de bits em uma sequ�ncia de
% s�mbolos QPSK, onde:
%   00 -> s1 = sqrt(Es)*exp(1i*pi/4)
%   01 -> s2 = sqrt(Es)*exp(1i*3*pi/4)
%   11 -> s3 = sqrt(Es)*exp(-1i*3*pi/4)
%   10 -> s4 = sqrt(Es)*exp(-1i*pi/4)
%% S�mbolos poss�veis
symbols = zeros(1, length(bits)/2);

Es = 2*Eb; % Energia dos s�mbolos

s1 = sqrt(Es/2)*exp(1i*pi/4);
s2 = sqrt(Es/2)*exp(1i*3*pi/4);
s3 = sqrt(Es/2)*exp(-1i*3*pi/4);
s4 = sqrt(Es/2)*exp(-1i*pi/4);

compareVector = [s1, s2, s3, s4]; % Vetor com os s�mbolos poss�veis

%% Percorrendo o vetor de bits
for i = 1:2:length(bits)-1
    current = bits(i:i+1);
  
    if current == [0 0]
          symbols((i+1)/2) = s1;
    
    elseif current == [0 1]
          symbols((i+1)/2) = s2;
    
    elseif current == [1 1]
          symbols((i+1)/2) = s3;
    
    elseif current == [1 0]
          symbols((i+1)/2) = s4;
    end          
  
end

end

