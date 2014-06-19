set_attribute library {{ /chalmers/sw/sup/cds/cmos065-5.3.4/CORE65LPSVT_5.1/libs/CORE65LPSVT_nom_1.20V_25C.lib }}
read_hdl -vhdl const.vhd enc.vhd dec.vhd sim.vhd
elaborate
define_clock -name main_clk -period 1000 [find / -port clk]
synthesize -to_mapped -effort low

set_attribute lp_asserted_probability 0.5 /designs/sim/ports_in/din*
set_attribute lp_asserted_probability 0.01 /designs/sim/ports_in/error*
set_attribute lp_asserted_toggle_rate 15 /designs/sim/ports_in/din*
set_attribute lp_asserted_toggle_rate 15 /designs/sim/ports_in/error*


report power > sim_power_1GHz.txt
report timing > sim_timing_1GHz.txt
exit
