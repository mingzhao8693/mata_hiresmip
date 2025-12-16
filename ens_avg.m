function [vx]=ens_avg(vx1,vx2,vx3,vx4,vx5)
vx.nyr=100; nn=5;
vx.id_sum =(vx1.id_sum+vx2.id_sum+vx3.id_sum+vx4.id_sum+vx5.id_sum);
vx.frqday =(vx1.frqday+vx2.frqday+vx3.frqday+vx4.frqday+vx5.frqday)/nn;

vx.prday_av   =(vx1.prday_av   +vx2.prday_av   +vx3.prday_av   +vx4.prday_av+vx5.prday_av)/nn;
vx.prday_idwei=(vx1.prday_idwei+vx2.prday_idwei+vx3.prday_idwei+vx4.prday_idwei+vx5.prday_idwei)/nn;
vx.prday_idavg=(vx1.prday_idavg+vx2.prday_idavg+vx3.prday_idavg+vx4.prday_idavg+vx5.prday_idavg)/nn;
vx.prday_idstd=(vx1.prday_idstd+vx2.prday_idstd+vx3.prday_idstd+vx4.prday_idstd+vx5.prday_idstd)/nn;

vx.prw_av   =(vx1.prw_av   +vx2.prw_av   +vx3.prw_av   +vx4.prw_av+vx5.prw_av)/nn;
vx.prw_idwei=(vx1.prw_idwei+vx2.prw_idwei+vx3.prw_idwei+vx4.prw_idwei+vx5.prw_idwei)/nn;
vx.prw_idavg=(vx1.prw_idavg+vx2.prw_idavg+vx3.prw_idavg+vx4.prw_idavg+vx5.prw_idavg)/nn;
vx.prw_idstd=(vx1.prw_idstd+vx2.prw_idstd+vx3.prw_idstd+vx4.prw_idstd+vx5.prw_idstd)/nn;

vx.lwcf_av   =(vx1.lwcf_av   +vx2.lwcf_av   +vx3.lwcf_av   +vx4.lwcf_av+vx5.lwcf_av)/nn;
vx.lwcf_idwei=(vx1.lwcf_idwei+vx2.lwcf_idwei+vx3.lwcf_idwei+vx4.lwcf_idwei+vx5.lwcf_idwei)/nn;
vx.lwcf_idavg=(vx1.lwcf_idavg+vx2.lwcf_idavg+vx3.lwcf_idavg+vx4.lwcf_idavg+vx5.lwcf_idavg)/nn;
vx.lwcf_idstd=(vx1.lwcf_idstd+vx2.lwcf_idstd+vx3.lwcf_idstd+vx4.lwcf_idstd+vx5.lwcf_idstd)/nn;

vx.swcf_av   =(vx1.swcf_av   +vx2.swcf_av   +vx3.swcf_av   +vx4.swcf_av+vx5.swcf_av)/nn;
vx.swcf_idwei=(vx1.swcf_idwei+vx2.swcf_idwei+vx3.swcf_idwei+vx4.swcf_idwei+vx5.swcf_idwei)/nn;
vx.swcf_idavg=(vx1.swcf_idavg+vx2.swcf_idavg+vx3.swcf_idavg+vx4.swcf_idavg+vx5.swcf_idavg)/nn;
vx.swcf_idstd=(vx1.swcf_idstd+vx2.swcf_idstd+vx3.swcf_idstd+vx4.swcf_idstd+vx5.swcf_idstd)/nn;

vx.ttcf_av   =(vx1.ttcf_av   +vx2.ttcf_av   +vx3.ttcf_av   +vx4.ttcf_av+vx5.ttcf_av)/nn;
vx.ttcf_idwei=(vx1.ttcf_idwei+vx2.ttcf_idwei+vx3.ttcf_idwei+vx4.ttcf_idwei+vx5.ttcf_idwei)/nn;
vx.ttcf_idavg=(vx1.ttcf_idavg+vx2.ttcf_idavg+vx3.ttcf_idavg+vx4.ttcf_idavg+vx5.ttcf_idavg)/nn;
vx.ttcf_idstd=(vx1.ttcf_idstd+vx2.ttcf_idstd+vx3.ttcf_idstd+vx4.ttcf_idstd+vx5.ttcf_idstd)/nn;

vx.netradclr_av   =(vx1.netradclr_av   +vx2.netradclr_av   +vx3.netradclr_av   +vx4.netradclr_av+vx5.netradclr_av)/nn;
vx.netradclr_idwei=(vx1.netradclr_idwei+vx2.netradclr_idwei+vx3.netradclr_idwei+vx4.netradclr_idwei+vx5.netradclr_idwei)/nn;
vx.netradclr_idavg=(vx1.netradclr_idavg+vx2.netradclr_idavg+vx3.netradclr_idavg+vx4.netradclr_idavg+vx5.netradclr_idavg)/nn;
vx.netradclr_idstd=(vx1.netradclr_idstd+vx2.netradclr_idstd+vx3.netradclr_idstd+vx4.netradclr_idstd+vx5.netradclr_idstd)/nn;

vx.netrad_av   =(vx1.netrad_av   +vx2.netrad_av   +vx3.netrad_av   +vx4.netrad_av+vx5.netrad_av)/nn;
vx.netrad_idwei=(vx1.netrad_idwei+vx2.netrad_idwei+vx3.netrad_idwei+vx4.netrad_idwei+vx5.netrad_idwei)/nn;
vx.netrad_idavg=(vx1.netrad_idavg+vx2.netrad_idavg+vx3.netrad_idavg+vx4.netrad_idavg+vx5.netrad_idavg)/nn;
vx.netrad_idstd=(vx1.netrad_idstd+vx2.netrad_idstd+vx3.netrad_idstd+vx4.netrad_idstd+vx5.netrad_idstd)/nn;

vx.rlut_av   =(vx1.rlut_av   +vx2.rlut_av   +vx3.rlut_av   +vx4.rlut_av+vx5.rlut_av)/nn;
vx.rlut_idwei=(vx1.rlut_idwei+vx2.rlut_idwei+vx3.rlut_idwei+vx4.rlut_idwei+vx5.rlut_idwei)/nn;
vx.rlut_idavg=(vx1.rlut_idavg+vx2.rlut_idavg+vx3.rlut_idavg+vx4.rlut_idavg+vx5.rlut_idavg)/nn;
vx.rlut_idstd=(vx1.rlut_idstd+vx2.rlut_idstd+vx3.rlut_idstd+vx4.rlut_idstd+vx5.rlut_idstd)/nn;

vx.swabs_av   =(vx1.swabs_av   +vx2.swabs_av   +vx3.swabs_av   +vx4.swabs_av+vx5.swabs_av)/nn;
vx.swabs_idwei=(vx1.swabs_idwei+vx2.swabs_idwei+vx3.swabs_idwei+vx4.swabs_idwei+vx5.swabs_idwei)/nn;
vx.swabs_idavg=(vx1.swabs_idavg+vx2.swabs_idavg+vx3.swabs_idavg+vx4.swabs_idavg+vx5.swabs_idavg)/nn;
vx.swabs_idstd=(vx1.swabs_idstd+vx2.swabs_idstd+vx3.swabs_idstd+vx4.swabs_idstd+vx5.swabs_idstd)/nn;

vx.rlutcs_av   =(vx1.rlutcs_av   +vx2.rlutcs_av   +vx3.rlutcs_av   +vx4.rlutcs_av+vx5.rlutcs_av)/nn;
vx.rlutcs_idwei=(vx1.rlutcs_idwei+vx2.rlutcs_idwei+vx3.rlutcs_idwei+vx4.rlutcs_idwei+vx5.rlutcs_idwei)/nn;
vx.rlutcs_idavg=(vx1.rlutcs_idavg+vx2.rlutcs_idavg+vx3.rlutcs_idavg+vx4.rlutcs_idavg+vx5.rlutcs_idavg)/nn;
vx.rlutcs_idstd=(vx1.rlutcs_idstd+vx2.rlutcs_idstd+vx3.rlutcs_idstd+vx4.rlutcs_idstd+vx5.rlutcs_idstd)/nn;

vx.rsut_av   =(vx1.rsut_av   +vx2.rsut_av   +vx3.rsut_av   +vx4.rsut_av+vx5.rsut_av)/nn;
vx.rsut_idwei=(vx1.rsut_idwei+vx2.rsut_idwei+vx3.rsut_idwei+vx4.rsut_idwei+vx5.rsut_idwei)/nn;
vx.rsut_idavg=(vx1.rsut_idavg+vx2.rsut_idavg+vx3.rsut_idavg+vx4.rsut_idavg+vx5.rsut_idavg)/nn;
vx.rsut_idstd=(vx1.rsut_idstd+vx2.rsut_idstd+vx3.rsut_idstd+vx4.rsut_idstd+vx5.rsut_idstd)/nn;

vx.rsutcs_av   =(vx1.rsutcs_av   +vx2.rsutcs_av   +vx3.rsutcs_av   +vx4.rsutcs_av+vx5.rsutcs_av)/nn;
vx.rsutcs_idwei=(vx1.rsutcs_idwei+vx2.rsutcs_idwei+vx3.rsutcs_idwei+vx4.rsutcs_idwei+vx5.rsutcs_idwei)/nn;
vx.rsutcs_idavg=(vx1.rsutcs_idavg+vx2.rsutcs_idavg+vx3.rsutcs_idavg+vx4.rsutcs_idavg+vx5.rsutcs_idavg)/nn;
vx.rsutcs_idstd=(vx1.rsutcs_idstd+vx2.rsutcs_idstd+vx3.rsutcs_idstd+vx4.rsutcs_idstd+vx5.rsutcs_idstd)/nn;

return
