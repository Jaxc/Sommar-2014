set_attribute library {{ /chalmers/sw/sup/cds/cmos065-5.3.4/CORE65LPSVT_5.1/libs/CORE65LPSVT_nom_1.20V_25C.lib }}
read_hdl -vhdl const.vhd enc.vhd dec.vhd enc_dec_wrapper.vhd
elaborate
define_clock -name main_clk -period  [find / -port clk]
synthesize -to_mapped -effort medium

set_attribute lp_asserted_probability 0.5 /designs/enc_dec_wrapper/ports_in/din
set_attribute lp_asserted_toggle_rate  /designs/enc_dec_wrapper/ports_in/din
set_attribute lp_asserted_probability 0.001 /designs/enc_dec_wrapper/ports_in/error
set_attribute lp_asserted_toggle_rate  /designs/enc_dec_wrapper/ports_in/din
set_attribute lp_power_analysis_effort medium/

report power > sim_power_GHz.txt
report timing > sim_timing_GHz.txt
 
set_attribute gui_sv_update manual /
set_attribute gui_sv_threshold 5000 /
exit