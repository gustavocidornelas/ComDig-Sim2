function [  ] = plotResults( BER, Eb_N0_dB, scenario )
%% Função plotResults()
% Plota a curva BER x Eb/N0 resultante da simulação de acordo com o cenário
% (canal) sendo simulado.

% QPSK em canal AWGN ======================================================
if scenario == 1 
  BER_theory = qfunc(sqrt(10.^(Eb_N0_dB/10)));
  results = semilogy(Eb_N0_dB, BER_theory, '-o', Eb_N0_dB, BER);
  set(results, 'linewidth', 2);
  legend('Teoria', 'Simulação');
  xlabel('E_b/N_0 (dB)');
  ylabel('BER');
  title('Desempenho do QPSK em um canal AWGN');
  grid on;  

% QPSK em canal h[k] sem equalização ======================================
elseif scenario == 2 
  results = semilogy(Eb_N0_dB, BER);
  set(results, 'linewidth', 2);
  legend('Simulação');
  xlabel('E_b/N_0 (dB)');
  ylabel('BER');
  title('Desempenho do QPSK em um canal h[k]');
  grid on; 
  
% SC-FDE em canal h[k] com equalização ZF =================================
elseif scenario == 3
  results = semilogy(Eb_N0_dB, BER);
  set(results, 'linewidth', 2);
  legend('Simulação');
  xlabel('E_b/N_0 (dB)');
  ylabel('BER');
  title('Desempenho do SC-FDE em um canal h[k] com equalização ZF');
  grid on; 
  
% SC-FDE em canal h[k] com equalização MMSE ===============================
elseif scenario == 4
  results = semilogy(Eb_N0_dB, BER);
  set(results, 'linewidth', 2);
  legend('Simulação');
  xlabel('E_b/N_0 (dB)');
  ylabel('BER');
  title('Desempenho do SC-FDE em um canal h[k] com equalização MMSE');
  grid on; 
end

end

