###################################################################

# Created by write_sdc on Mon May 27 17:46:55 2024

###################################################################
set sdc_version 2.1

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions -max ss_typical_max_0p81v_125c -max_library           \
sc9_cln40g_base_rvt_ss_typical_max_0p81v_125c\
                         -min ff_typical_min_0p99v_m40c -min_library           \
sc9_cln40g_base_rvt_ff_typical_min_0p99v_m40c
set_wire_load_mode top
set_wire_load_model -name Zero -library                                        \
sc9_cln40g_base_rvt_ss_typical_max_0p81v_125c
set_ideal_network [get_ports clk]
create_clock [get_ports clk]  -period 2.76  -waveform {0 1.38}
set_input_delay -clock clk  0  [get_ports start]
set_input_delay -clock clk  0  [get_ports rst_n]
set_input_delay -clock clk  0  [get_ports {inportR[8]}]
set_input_delay -clock clk  0  [get_ports {inportR[7]}]
set_input_delay -clock clk  0  [get_ports {inportR[6]}]
set_input_delay -clock clk  0  [get_ports {inportR[5]}]
set_input_delay -clock clk  0  [get_ports {inportR[4]}]
set_input_delay -clock clk  0  [get_ports {inportR[3]}]
set_input_delay -clock clk  0  [get_ports {inportR[2]}]
set_input_delay -clock clk  0  [get_ports {inportR[1]}]
set_input_delay -clock clk  0  [get_ports {inportR[0]}]
set_input_delay -clock clk  0  [get_ports {inportG[8]}]
set_input_delay -clock clk  0  [get_ports {inportG[7]}]
set_input_delay -clock clk  0  [get_ports {inportG[6]}]
set_input_delay -clock clk  0  [get_ports {inportG[5]}]
set_input_delay -clock clk  0  [get_ports {inportG[4]}]
set_input_delay -clock clk  0  [get_ports {inportG[3]}]
set_input_delay -clock clk  0  [get_ports {inportG[2]}]
set_input_delay -clock clk  0  [get_ports {inportG[1]}]
set_input_delay -clock clk  0  [get_ports {inportG[0]}]
set_input_delay -clock clk  0  [get_ports {inportB[8]}]
set_input_delay -clock clk  0  [get_ports {inportB[7]}]
set_input_delay -clock clk  0  [get_ports {inportB[6]}]
set_input_delay -clock clk  0  [get_ports {inportB[5]}]
set_input_delay -clock clk  0  [get_ports {inportB[4]}]
set_input_delay -clock clk  0  [get_ports {inportB[3]}]
set_input_delay -clock clk  0  [get_ports {inportB[2]}]
set_input_delay -clock clk  0  [get_ports {inportB[1]}]
set_input_delay -clock clk  0  [get_ports {inportB[0]}]
set_output_delay -clock clk  0  [get_ports done]
set_output_delay -clock clk  0  [get_ports {outportY[8]}]
set_output_delay -clock clk  0  [get_ports {outportY[7]}]
set_output_delay -clock clk  0  [get_ports {outportY[6]}]
set_output_delay -clock clk  0  [get_ports {outportY[5]}]
set_output_delay -clock clk  0  [get_ports {outportY[4]}]
set_output_delay -clock clk  0  [get_ports {outportY[3]}]
set_output_delay -clock clk  0  [get_ports {outportY[2]}]
set_output_delay -clock clk  0  [get_ports {outportY[1]}]
set_output_delay -clock clk  0  [get_ports {outportY[0]}]
set_output_delay -clock clk  0  [get_ports {outportU[8]}]
set_output_delay -clock clk  0  [get_ports {outportU[7]}]
set_output_delay -clock clk  0  [get_ports {outportU[6]}]
set_output_delay -clock clk  0  [get_ports {outportU[5]}]
set_output_delay -clock clk  0  [get_ports {outportU[4]}]
set_output_delay -clock clk  0  [get_ports {outportU[3]}]
set_output_delay -clock clk  0  [get_ports {outportU[2]}]
set_output_delay -clock clk  0  [get_ports {outportU[1]}]
set_output_delay -clock clk  0  [get_ports {outportU[0]}]
set_output_delay -clock clk  0  [get_ports {outportV[8]}]
set_output_delay -clock clk  0  [get_ports {outportV[7]}]
set_output_delay -clock clk  0  [get_ports {outportV[6]}]
set_output_delay -clock clk  0  [get_ports {outportV[5]}]
set_output_delay -clock clk  0  [get_ports {outportV[4]}]
set_output_delay -clock clk  0  [get_ports {outportV[3]}]
set_output_delay -clock clk  0  [get_ports {outportV[2]}]
set_output_delay -clock clk  0  [get_ports {outportV[1]}]
set_output_delay -clock clk  0  [get_ports {outportV[0]}]
