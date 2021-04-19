function subCarriers = subCarryGen(carrierFrequency,numSub,bitrate,data)
    global Ts;
    carrierSpread = bitrate/numSub;
    sideBand = linspace(carrierSpread,carrierSpread*numSub/2,numSub/2);
    allFrequencies = carrierFrequency + [-flip(sideBand),sideBand];
    subBitRate = bitrate/(numSub);
    subcarriers = cos(2*pi*allFrequencies'*[Ts:Ts:length(data)/bitrate]);

end