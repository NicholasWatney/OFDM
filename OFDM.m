

% ECE 4271: Applications of Digital Signal Processing
% Project 4: Othogonal Frequency Division Multiplexing
% Authors: Michael Probst and Nicholas Meyer

clear; clc; close all;

len = 2^20;
channels = 8;
SNR = 50;
BER = OFDM_(len, channels, SNR);

SNRs = [-100:1/2:50];
BERs = [];
figure();
hold on;
for i = SNRs
    BER = OFDM_(len, channels, i);
    BERs = [BERs, BER];
end
stem(SNRs, log10(BERs));
hold off;

function BER = OFDM_(len, channels, SNR)

    bits = dataGeneration(len);
    symbols = encode(bits);
    modulated = modulate(symbols, channels);
    received = noiseGeneration(modulated, SNR);
    demodulated = demodulate(received, channels);
    bits_approx = decode(demodulated);
    BER = ber(bits, bits_approx);

end
