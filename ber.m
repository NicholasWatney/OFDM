

function BER = ber(bits, bits_approx)
    BER = sum(bits ~= bits_approx) / length(bits);
end
