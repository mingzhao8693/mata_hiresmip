function reconstruct = harmonic_reconstruct(time, signal, harmonic)

% This function gives the reconstructed signal up to specified harmonic using Fourier sine and cosine series
% 
% INPUTS:
% time     - time axis of the signal(one dimintional vector)
% signal   - actual signal for which reconstruction up to the specified harmoic must be obtained(one dimintional vector)
% harmonic - harmonic up to which the signal must be reconstructed(integer)
% 
% OUTPUTS:
% reconstruct - resonstructed signal up to the specified harmoic(one dimintional vector)

T = length(time);
an = zeros(1, harmonic);
bn = zeros(1, harmonic);

for n = 1:harmonic
    an(n) = (2/T)* signal*cos(2*pi*n*time)';
    bn(n) = (2/T)* signal*sin(2*pi*n*time)';
end

reconstruct = mean(signal)*ones(1, length(time));

for n = 1:harmonic
    reconstruct = reconstruct + an(n)*cos(2*pi*n*time) + bn(n)*sin(2*pi*n*time);
end

end