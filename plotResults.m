function [  ] = plotResults( BER, Eb_N0_dB, scenario )
%% Fun��o plotResults()
% Plota a curva BER x Eb/N0 resultante da simula��o de acordo com o cen�rio
% (canal) sendo simulado.

% QPSK em canal AWGN ======================================================
if scenario == 1 
  BER_theory = qfunc(sqrt(10.^(Eb_N0_dB/10)));
  results = semilogy(Eb_N0_dB, BER_theory, '-o', Eb_N0_dB, BER);
  set(results, 'linewidth', 2);
  legend('Teoria', 'Simula��o');
  xlabel('E_b/N_0 (dB)');
  ylabel('BER');
  title('Desempenho do QPSK em um canal AWGN');
  grid on;  

% QPSK em canal h[k] sem equaliza��o ======================================
elseif scenario == 2 
  results = semilogy(Eb_N0_dB, BER);
  set(results, 'linewidth', 2);
  legend('Simula��o');
  xlabel('E_b/N_0 (dB)');
  ylabel('BER');
  title('Desempenho do QPSK em um canal h[k]');
  grid on; 
  
% SC-FDE em canal h[k] com equaliza��o ZF =================================
elseif scenario == 3
  results = semilogy(Eb_N0_dB, BER);
  set(results, 'linewidth', 2);
  legend('Simula��o');
  xlabel('E_b/N_0 (dB)');
  ylabel('BER');
  title('Desempenho do SC-FDE em um canal h[k] com equaliza��o ZF');
  grid on; 
  
% SC-FDE em canal h[k] com equaliza��o MMSE ===============================
elseif scenario == 4
  results = semilogy(Eb_N0_dB, BER);
  set(results, 'linewidth', 2);
  legend('Simula��o');
  xlabel('E_b/N_0 (dB)');
  ylabel('BER');
  title('Desempenho do SC-FDE em um canal h[k] com equaliza��o MMSE');
  grid on; 
end

end

