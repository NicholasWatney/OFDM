

function bits = decodeqam(symbols)
    first = real(symbols)>0;  % first bit is the sign of the real component
    second = abs(real(symbols))<2; % second bit is determined by the magnitude of the imaginary component
    third = imag(symbols)>0; % third bit is the sign of the imaginary component
    fourth = abs(imag(symbols))<2; % fourth bit is determined by the magnitude of the imaginary component
    bits = [first;second;third;fourth]; %align the decoded bits
    bits = double(reshape(bits, 1, 4*length(bits))); % serialize the bits
end