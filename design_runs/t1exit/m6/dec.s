set_attribute library {{ /chalmers/sw/sup/cds/cmos065-5.3.4/CORE65LPSVT_5.1/libs/CORE65LPSVT_nom_1.20V_25C.lib }}
read_hdl -vhdl const.vhd dec.vhd
elaborate
define_clock -name main_clk -period 500 [find / -port clk]
synthesize -to_mapped -effort low

set_attribute lp_asserted_probability 0.5 /designs/sim/ports_in/din*
set_attribute lp_asserted_probability 0.0666 /designs/sim/ports_in/error*
set_attribute lp_asserted_toggle_rate 7.5 /designs/sim/ports_in/din*
set_attribute lp_asserted_toggle_rate 7.5 /designs/sim/ports_in/error*


report power > dec_power.txt
exit
