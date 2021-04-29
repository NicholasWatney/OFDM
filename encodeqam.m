

function symbols = encodeqam(bits) % will use gray code (in 8 lines lol)
    inter = reshape(bits,4,length(bits)/4); % reshape to encode bits of four
    first = 2*(inter(1,:)==1)-1;  % first bit defines sign of real component
    second = 1-0.5*(inter(2,:)==1); % second bit defines magnitude of real component
    third = 2*(inter(3,:)==1)-1; % third bit defines sign of imaginary component
    fourth = 1-0.5*(inter(4,:)==1); % fourth bit defines magnitude of imaginary component
    symbols = first.*second + j*third.*fourth; % combine to produce signals
end