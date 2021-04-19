
% ECE 4271: Applications of Digital Signal Processing
% Project 4: Othogonal Frequency Division Multiplexing
% Authors: Michael Probst and Nicholas Meyer

clear; clc; close all;
global debug;
global Fs;
global Ts;


% Temporary values for testing and debugging

debug = 0;
bitRate = 10^6;
Fs = 10*bitRate;
Ts = 1/Fs;
carrierFrequency = 10^7;    % carrier frequency
bitRate = 10^6;
bandwidth = bitRate;
numSubChannels = 100;


data = round(rand(1,10^4));
SNR = 10;
subcarriers = subCarriers(carrierFrequency,numSubChannels,bitRate,data);