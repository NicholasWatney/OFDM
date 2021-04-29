
%% SNR GENERATION
clc; close all; clc;

Fs = 100;
Ts = 1/Fs;
n = 0:Ts:1-Ts;

SNR = -10;

x_n = sin(2*pi*(1:10)'*n);

noisySignal = noiseGeneration(x_n, SNR);
hold on;

figure();
for i = 1:10
    subplot(5, 2, i);
    hold on;
    stem(x_n(i,:));
    stem(noisySignal(i,:));
end

%%
clear; clc; close all;

len = 16;
N = 1; 
SNR = 1;

rng default;
bits = dataGeneration(len);
symbols = encode(bits);
transmit = ifft(symbols, len * N);
noisySignal = noiseGeneration(transmit, -5);
received = fft(noisySignal, len * N);

figure();
hold on;
stem(transmit);
stem(noisySignal);

figure();
hold on;
stem(symbols(1:len));
stem(received(1:len));
