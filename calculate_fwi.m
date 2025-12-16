function FWI = calculate_fwi(ISI, BUI)
    if BUI <= 80
        fD = 0.626 * BUI^0.809 + 2.0;
    else
        fD = 1000.0 / (25.0 + 108.64 * exp(-0.023 * BUI));
    end

    FWI = ISI * fD;
    
    % Final adjustment (complex formula to scale FWI)
    if FWI > 1.0
        FWI = exp(2.72 * (0.434 * log(FWI))^0.647);
    end
    FWI = max(0, FWI); % FWI cannot be negative
end
