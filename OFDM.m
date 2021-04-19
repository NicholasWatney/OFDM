

% ECE 4271: Applications of Digital Signal Processing
% Project 4: Othogonal Frequency Division Multiplexing
% Authors: Michael Probst and Nicholas Meyer

clear; clc; close all;
global debug;
global Fs;
global Ts;

% Temporary values for testing and debugging

debug = 1;
Fs = 256;
Ts = 1/Fs;

SNR = 10;
n = 0:Ts:1-Ts;
signal = sin(2*pi*1*n);
noisySignal = noiseGeneration(signal, SNR);

% transmitter and receiver
% @param length of bits
% @return bit error rate
function ber = transceiver(length)
    bits = dataGeneration(length);
end

% randomly generates a random sequence
% of 1's and 0's of length
% @param length of bits
% @return random sequence of bits
function bits = dataGeneration(length)
    bits = round(rand(1, length));
end

% generate white gaussian noise
% with zero mean and variable variance
% @param signal transmitted signal
% @param SNR singal to noise ratio
% @return noisySignal simulated received signal
function noisySignal = noiseGeneration(signal, SNR)
    variance = 10 ^ (-SNR / 10) * (rms(signal) ^ 2);
    std_dev = sqrt(variance);
    noise = sqrt(3) * std_dev * rand(1, length(signal));
    noise = (1 - 2 * round(rand(1, length(noise)))) .* noise;
    noisySignal = signal + noise;

    global debug
    if (debug)
        figure();
        stem(signal, "b");
        hold on;
        stem(noise, "r");
        plot(noisySignal, "kx-");
        legend("Transmitted", "Noise", "Received");
        xlabel("Sample:"); ylabel("Amplitude:");
        title("The Effects of Noise on a Transmitted Signal, SNR: " + snr(signal, noise));
        fprintf("SNR ratio: %f\n", snr(signal, noise));
    end
end
jk