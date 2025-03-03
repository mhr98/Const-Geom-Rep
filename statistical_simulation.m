
% BER_simulation: This program simulate the bit error rate for a BPSK
% constellation with the signal to noise ratio.
% Copyright (C) 2025  Mohammad Safa
% GitHub Repository: https://github.com/mhr8/Const_Geom_Rep
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
%% visulize the statistical properties
clear
SNR_dB=2; %signal to noise ratio (Eb/No) in dB (modify)

symboles_length=1000000;
SNR=10^(SNR_dB/10);
Eb=1; %avereg energy per bit
No=Eb/SNR;

noise_power=No/2;

in_data=(rand(1,symboles_length)>0.5); %generat random 1s and 0s
%in_data=ones(1,symboles_length); %send only ones
%in_data=zeros(1,symboles_length); %send only zeros

Tx=2*in_data-1; %convert 1=>1, 0=>-1
plot_const(Tx(1:10),zeros(1,10)) %transmitted signal costellation
title('Tx', 'FontSize', 18, 'FontName', 'Times');

n=sqrt(noise_power)*randn(1,symboles_length); %generate noise samples

Rx=Tx+n; %recieved signal

plot_const(Rx(1:10),zeros(1,10))%Received signal costellation
title('Rx', 'FontSize', 18, 'FontName', 'Times');

figure
hist(Rx,100) %Statistical distrebution
xlim([-4 4])
grid




