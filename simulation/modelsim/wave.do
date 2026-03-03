onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /clock_top_57_tb/eachvec
add wave -noupdate /clock_top_57_tb/clk_50m_57
add wave -noupdate /clock_top_57_tb/i1/clk_1k_57
add wave -noupdate /clock_top_57_tb/key_57
add wave -noupdate /clock_top_57_tb/rst_57
add wave -noupdate /clock_top_57_tb/sw_57
add wave -noupdate /clock_top_57_tb/bell_57
add wave -noupdate -radix binary /clock_top_57_tb/dig_57
add wave -noupdate /clock_top_57_tb/led_57
add wave -noupdate -radix binary /clock_top_57_tb/seg_57
add wave -noupdate -divider display
add wave -noupdate /clock_top_57_tb/i1/u_display_57/time_model_57
add wave -noupdate /clock_top_57_tb/i1/u_display_57/week_e_57
add wave -noupdate /clock_top_57_tb/i1/u_display_57/shine_e_57
add wave -noupdate /clock_top_57_tb/i1/u_display_57/select_57
add wave -noupdate /clock_top_57_tb/i1/u_display_57/sec_57
add wave -noupdate /clock_top_57_tb/i1/u_display_57/min_57
add wave -noupdate /clock_top_57_tb/i1/u_display_57/hour_57
add wave -noupdate /clock_top_57_tb/i1/u_display_57/seg_57
add wave -noupdate /clock_top_57_tb/i1/u_display_57/dig_o_57
add wave -noupdate /clock_top_57_tb/i1/u_display_57/dig_57
add wave -noupdate /clock_top_57_tb/i1/u_display_57/current_num_57
add wave -noupdate /clock_top_57_tb/i1/u_display_57/shine_57
add wave -noupdate /clock_top_57_tb/i1/u_display_57/select_two_57
add wave -noupdate -divider time_ctrl
add wave -noupdate /clock_top_57_tb/i1/u_time_clock_correct_57/clk_1_57
add wave -noupdate /clock_top_57_tb/i1/u_time_clock_correct_57/clock_e_57
add wave -noupdate /clock_top_57_tb/i1/u_time_clock_correct_57/correct_e_57
add wave -noupdate /clock_top_57_tb/i1/u_time_clock_correct_57/sec_57
add wave -noupdate /clock_top_57_tb/i1/u_time_clock_correct_57/min_57
add wave -noupdate /clock_top_57_tb/i1/u_time_clock_correct_57/hour_57
add wave -noupdate /clock_top_57_tb/i1/u_time_clock_correct_57/current_num_57
add wave -noupdate /clock_top_57_tb/i1/u_time_clock_correct_57/select_reg_57
add wave -noupdate /clock_top_57_tb/i1/u_time_clock_correct_57/key_add_57_prev
add wave -noupdate /clock_top_57_tb/i1/u_time_clock_correct_57/key_sub_57_prev
add wave -noupdate /clock_top_57_tb/i1/u_time_clock_correct_57/key_select_57
add wave -noupdate /clock_top_57_tb/i1/u_time_clock_correct_57/key_add_57
add wave -noupdate /clock_top_57_tb/i1/u_time_clock_correct_57/key_sub_57
add wave -noupdate /clock_top_57_tb/i1/u_time_clock_correct_57/select_57
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {400000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {2486349 ps}
