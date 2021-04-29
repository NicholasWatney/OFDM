

function noisySignal = noiseGeneration(signal, SNR)
    variance = 10 .^ (-SNR / 10) .* (rms(signal) .^ 2);
    std_dev = sqrt(variance);
    noise = sqrt(3) .* std_dev .* rand(size(signal));
    noise = (1 - 2 .* round(rand(size(signal)))) .* noise;
    noisySignal = signal + noise;
end

