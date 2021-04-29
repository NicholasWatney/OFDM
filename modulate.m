

function transmit = modulate(symbols, channels)
    parallel = reshape(symbols, channels, length(symbols)/channels);
    transmit = ifft(parallel);
end
