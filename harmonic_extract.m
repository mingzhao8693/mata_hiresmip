function nHarmonic = harmonic_extract(time, signal, n)

% This function gives the nth harmonic of the signal using Fourier sine and cosine series
% 
% INPUTS:
% time   - time axis of the signal(one dimintional vector)
% signal - actual signal for which the specific harmonic must be obtained(one dimintional vector)
% n      - the harmonic to extract(integer)
% 
% OUTPUTS:
% nHarmonic - the nth harmonic of the signal

T = length(time);               

an = (2/T)* signal*cos(2*pi*n*time)';
bn = (2/T)* signal*sin(2*pi*n*time)';
    
cos_part = an*cos(2*pi*n*time);
sin_part = bn*sin(2*pi*n*time);
    
nHarmonic = cos_part + sin_part;
end