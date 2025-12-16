function BUI = calculate_bui(DMC, DC)
    if DMC <= 0.4 * DC
        BUI = (0.8 * DMC * DC) / (DMC + 0.4 * DC);
    else
        BUI = DMC - (1.0 - 0.8 * DC / (DMC + 0.4 * DC));
        BUI = max(0, BUI); % BUI cannot be negative
    end
end
