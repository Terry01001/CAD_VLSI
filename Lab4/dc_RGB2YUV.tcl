set Company 		"VLSIDA"
set Designer 		""

#設定40nm製程路徑
set search_path       "/cad/CBDK/CBDK_TSMC40_Arm_f2.0/CIC/SynopsysDC/db/sc9_base_rvt/  $search_path"

#設定40nm製程路徑檔，如果有memory compiler的檔案db檔的路徑，記得在這邊設定
set target_library   "sc9_cln40g_base_rvt_ss_typical_max_0p81v_125c.db sc9_cln40g_base_rvt_ff_typical_min_0p99v_m40c.db"
set link_library     "* $target_library dw_foundation.sldb"
set symbol_library   "tsmc040.sdb generic.sdb"
set synthetic_library "dw_foundation.sldb"
set hdlin_translate_off_skip_text "TRUE"
set edifout_netlist_only "TRUE"
set verilogout_no_tri true
set hdlin_enable_presto_for_vhdl "TRUE"
set sh_enable_line_editing true
set sh_line_editing_mode emacs
history keep 100
alias h history

#Path_Syn:合成後report.txt檔案要放置的根位置
#Dump_file_name:合成後產生檔案之名字
set Path_Syn		"./RGB2YUV_dc_out"
if {![file exists $Path_Syn]} {
    file mkdir $Path_Syn
}
set Dump_file_name "RGB2YUV_syn"
#設定Top module 名稱，需跟自行設計之電路的top module name相同
set Top				"RGB2YUV"
#Specify Clock，clock名需和top module中clk port相同
set Clk_pin			"clk"
set Clk_period		"20"

#Read Design
#如果設計有parameter設計，read_file指定不能用，需使用analyze + elaborate指令並自行更改路徑
# read_file -format verilog {/home/m103040049/HDL_HW/multiplier.v}
# current_design $Top
analyze -format verilog {testbench.v
  ROM.v
  RGB2YUV.v
  Register.v
  MUX4.v
  MUX3.v
  MUX2.v
  Multiplier.v
  Datapath.v
  Controller.v
Add.v}
elaborate $Top

#檢查是否讀取成功
link

#Max Delay (For Combinational Circurt)
# set_max_delay $Clk_period  -from [all_inputs] -to [all_outputs]
# create_clock -name $Clk_pin -period $Clk_period 

#Setting Timing Constraints、Specify Clock (For Sequential Circurt)
create_clock -name $Clk_pin -period $Clk_period [get_ports $Clk_pin]
set_dont_touch_network						[get_clocks $Clk_pin]
set_fix_hold									[get_clocks $Clk_pin]
set_ideal_network								[get_ports $Clk_pin]

#Setting Input / Output Delay
set_input_delay    	0    -clock $Clk_pin [remove_from_collection [all_inputs] [get_ports $Clk_pin]]
set_output_delay   	0    -clock $Clk_pin [all_outputs]

#Setting Operating Conditions
set_operating_conditions    -min_library sc9_cln40g_base_rvt_ff_typical_min_0p99v_m40c -min ff_typical_min_0p99v_m40c \
                            -max_library sc9_cln40g_base_rvt_ss_typical_max_0p81v_125c -max ss_typical_max_0p81v_125c

#Setting Wire Load Model
set_wire_load_model -name Zero -library sc9_cln40g_base_rvt_ss_typical_max_0p81v_125c                         
set_wire_load_mode top

#若合成時只考慮面積而不在意時間，則可以不設定Timing Constraints，只設定Max area為0
#set_max_area 0

compile

#Change Naming Rule
set bus_inference_style {%s[%d]}
set bus_naming_style {%s[%d]}
set hdlout_internal_busses true
change_names -hierarchy -rule verilog
define_name_rules name_rule -allowed "A-Z a-z 0-9 _" -max_length 255 -type cell
define_name_rules name_rule -allowed "A-Z a-z 0-9 _[]" -max_length 255 -type net
define_name_rules name_rule -map {{"\\*cell\\*""cell"}} 
define_name_rules name_rule -case_insensitive
change_names -hierarchy -rules name_rule
remove_unconnected_ports -blast_buses [get_cells -hierarchical *]

#Report
report_timing -path full -delay max -max_paths 1 -nworst 1 > $Path_Syn/timing_report.txt
report_area -hier -nosplit > $Path_Syn/area_report.txt
report_power -analysis_effort low > $Path_Syn/power_report.txt

#Write out
write -hierarchy -format ddc -output $Path_Syn/${Dump_file_name}.ddc
write -format verilog -hierarchy -output $Path_Syn/${Dump_file_name}.v
write_sdf -version 2.1 -context verilog $Path_Syn/${Dump_file_name}.sdf
write_sdc $Path_Syn/${Dump_file_name}.sdc