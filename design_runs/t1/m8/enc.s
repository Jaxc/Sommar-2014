set_attribute library {{ /chalmers/sw/sup/cds/cmos065-5.3.4/CORE65LPSVT_5.1/libs/CORE65LPSVT_nom_1.20V_25C.lib }}
read_hdl -vhdl const.vhd enc.vhd enc_wrapper.vhd 
elaborate
define_clock -name main_clk -period 500 [find / -port clk]
synthesize -to_mapped -effort low
report power > enc_power.txt

