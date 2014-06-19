set_attribute library {{ /chalmers/sw/sup/cds/cmos065-5.3.4/CORE65LPSVT_5.1/libs/CORE65LPSVT_nom_1.20V_25C.lib }}
read_hdl -vhdl const.vhd enc.vhd dec.vhd enc_dec_wrapper.vhd
elaborate
define_clock -name main_clk -period 400 [find / -port clk]
synthesize -to_mapped -effort medium

set_attribute lp_asserted_probability 0.5 /designs/enc_dec_wrapper/ports_in/din
set_attribute lp_asserted_toggle_rate 39.600 /designs/enc_dec_wrapper/ports_in/din



report power > sim_power_2.500GHz.txt
report timing > sim_timing_2.500GHz.txt
exit