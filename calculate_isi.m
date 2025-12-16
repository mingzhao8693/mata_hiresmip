function ISI = calculate_isi(FFMC, W)
    fP = exp(0.05039 * FFMC);
    % Wind effect adjustment for extreme wind is complex, but the core formula is:
    ISI = 0.208 * W^1.002 * fP; 
end
