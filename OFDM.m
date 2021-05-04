

% ECE 4271: Applications of Digital Signal Processing
% Project 4: Othogonal Frequency Division Multiplexing
% Authors: Michael Probst and Nicholas Meyer

%% 
clear; clc; close all;
len = 2^24;
channels = 8;
SNR = 20;
BER = OFDM_(len, channels, SNR, @encodeqam, @decodeqam);

%%

clear; clc; close all;
len = 2^15;
channels = 8;
SNR = 50;

SNRs = [-40:0.5:40];
SNRs = 20;
BPSKs = [];
figure();
hold on;
for i = SNRs
    BPSK = OFDM_(len, channels, i, @encode, @decode);
    BPSKs = [BPSKs, BPSK];
    disp("BPSK: " + i)
end

QAMs = [];
for i = SNRs
    QAM = OFDM_(len, channels, i, @encodeqam, @decodeqam);
    QAMs = [QAMs, QAM];
    disp("QPSK " + i)
end

stem(SNRs, BPSKs);
stem(SNRs, QAMs);
title("Linear BERs for different SNRs for BPSK and 16QAM")
xlabel("SNRs:"); ylabel("BERs:");
legend("BPSK", "QAM");
hold off;

figure();
hold on;
stem(SNRs, log10(BPSKs));
stem(SNRs, log10(QAMs));
title("Logarithmic BERs for different SNRs for BPSK and 16QAM")
xlabel("SNRs:"); ylabel("log10(BERs):");
legend("BPSK", "QAM");
hold off;

figure();
hold on;
semilogy(SNRs, BPSKs);
semilogy(SNRs, QAMs);
title("Semilog BERs for different SNRs for BPSK and 16QAM")
xlabel("SNRs:"); ylabel("Semilog(BERs:)");
legend("BPSK", "QAM");
hold off;

%%
function BER = OFDM_(len, channels, SNR, encode, decode)

    bits = dataGeneration(len);
    symbols = encode(bits);
    modulated = modulate(symbols, channels);

    received = noiseGeneration(modulated, SNR);
    demodulated = demodulate(received, channels);
    
    for i = 1 : length(demodulated)
        if sum(round(imag(demodulated(i)), 4) == [-3, -1, 1, 3]) == 1
            demodulated(i) = 0;
        end
    end
   
    figure();
    hold on;
    plot([0, 0], [-4, 4], 'k-', 'LineWidth', 2);
    plot([-4, 4], [0, 0], 'k-', 'LineWidth', 2);
    plot(demodulated, "r.", 'MarkerSize',1);
    plot([-2, -2], [-4, 4], 'k--', 'LineWidth', 1);
    plot([2, 2], [-4, 4], 'k--', 'LineWidth', 1);
    plot([-4, 4], [-2, -2], 'k--', 'LineWidth', 1);
    plot([-4, 4], [2, 2], 'k--', 'LineWidth', 1);
    hold off;
    axis([-4 4 -4 4]);
    title("Transmitted symbols"); xlabel("Real (in-phase):");
    ylabel("Imaginary (Quadrature):");
    title("Received symbols with SNR: " + SNR); xlabel("Real (in-phase):");
    ylabel("Imaginary (Quadrature):");
    hold off;

    bits_approx = decode(demodulated);
    BER = ber(bits, bits_approx);

end
