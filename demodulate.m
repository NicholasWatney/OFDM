

function demodulated = demodulate(received, channels)
    parallel = fft(received);
    demodulated = reshape(parallel, 1, length(parallel) * channels);
end
