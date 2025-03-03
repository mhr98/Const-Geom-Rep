
% BER_simulation: This program simulate the bit error rate for a BPSK
% constellation with the signal to noise ratio.
% Copyright (C) 2025  Mohammad Safa
% GitHub Repository: https://github.com/mhr98/Const-Geom-Rep
% 
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
% 
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <https://www.gnu.org/licenses/>.
%% BER simulation
clear
SNR_dB=[0 1 2 3 4 5]; %signal to noise ratio (Eb/No) in dB (modify)
Eb=1; %avereg energy per bit

BER_sim=[]; %simulated BER
BE_th=[]; %theoretical BER

symboles_length=10000; %the number of symboles per frame

for i=1:length(SNR_dB)
 
    SNR=10^(SNR_dB(i)/10);
    No=Eb/SNR;
    noise_power=No/2;
    
    nerror=0;
    nsym=0;
    
    while nerror < 50 %change it depending on the required accuracy
        
        in_data=(rand(1,symboles_length)>0.5); %generat random 1s and 0s
        Tx=2*in_data-1; %convert 1=>1, 0=>-1
        
        %plot the transmitted constelation

        n=sqrt(noise_power)*randn(1,symboles_length); %generate noise samples

        Rx=Tx+n; %received noise signal
        
        nerror=sum((Rx>0)~=in_data);
        nsym=nsym+symboles_length;
        
    end
    
    BER_sim=[BER_sim nerror/nsym]
    BE_th=[BE_th qfunc(sqrt(2*SNR))];
        
end

%plot the constlaition for the last frame
plot_const(Tx(1:10),zeros(1,10));    %plot the transmitted constelation
title('Tx', 'FontSize', 18, 'FontName', 'Times');
plot_const(Rx(1:10),zeros(1,10));    %plot the noisy received constelation
title('Rx', 'FontSize', 18, 'FontName', 'Times');


figure;
semilogy(SNR_dB,BER_sim,'r:','LineWidth',4)
hold on;grid on; box on;
semilogy(SNR_dB,BE_th,'b-','LineWidth',3);
xlabel('SNR(dB)','FontSize',18,'FontName', 'Times'); 
ylabel('BER','FontSize',18,'FontName', 'Times'); 
legend({'Simulated BER','Theoretical BER'},'FontSize',18,'FontName', 'Times')
set(gca,'FontSize',18)




