

function noisySignal = noiseGeneration(signal, SNR)
    variance = 10 ^ (-SNR / 10) * (rms(signal) ^ 2);
    std_dev = sqrt(variance);
    noise = sqrt(3) * std_dev * rand(1, length(signal));
    noise = (1 - 2 * round(rand(1, length(noise)))) .* noise;
    noisySignal = signal + noise;
end

