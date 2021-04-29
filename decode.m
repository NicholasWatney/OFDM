

function bits_approx = decode(demodulated)
    approx = (demodulated + 1) ./ 2;
    bits_approx = approx >= 0.5;
end
