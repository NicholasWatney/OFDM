

clc; close all; clc;

Fs = 100;
Ts = 1/Fs;
n = 0:Ts:1-Ts;

SNR = 10;

x_n = sin(2*pi*(1:10)'*n);

noisySignal = noiseGeneration(x_n, SNR);
hold on;

figure();
for i = 1:10
    subplot(5, 2, i);
    hold on;
    stem(signal(i,:));
    stem(noisySignal(i,:));
end
