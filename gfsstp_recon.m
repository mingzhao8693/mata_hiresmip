function x=gfsstp_recon(var, varp, p_thresh, g, optx)
if (optx==0)
  disp(optx)
  x=gfsstp_fast(var, varp, p_thresh, g, optx)
elseif (optx==1)
  disp(optx)
  x=gfsstp_slow(var, varp, p_thresh, g, optx)
end

return
