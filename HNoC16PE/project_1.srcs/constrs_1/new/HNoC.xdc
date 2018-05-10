create_clock -period 10.000 -name i_clk -waveform {0.000 5.000} [get_ports i_clk]

create_pblock pblock_sw1
add_cells_to_pblock [get_pblocks pblock_sw1] [get_cells -quiet [list L1/sw1]]
resize_pblock [get_pblocks pblock_sw1] -add {SLICE_X12Y415:SLICE_X29Y434}
resize_pblock [get_pblocks pblock_sw1] -add {RAMB18_X1Y166:RAMB18_X1Y173}
resize_pblock [get_pblocks pblock_sw1] -add {RAMB36_X1Y83:RAMB36_X1Y86}
create_pblock pblock_sw2
add_cells_to_pblock [get_pblocks pblock_sw2] [get_cells -quiet [list L1/sw2]]
resize_pblock [get_pblocks pblock_sw2] -add {SLICE_X36Y415:SLICE_X51Y434}
resize_pblock [get_pblocks pblock_sw2] -add {DSP48_X2Y166:DSP48_X2Y173}
resize_pblock [get_pblocks pblock_sw2] -add {RAMB18_X3Y166:RAMB18_X3Y173}
resize_pblock [get_pblocks pblock_sw2] -add {RAMB36_X3Y83:RAMB36_X3Y86}
create_pblock pblock_sw3
add_cells_to_pblock [get_pblocks pblock_sw3] [get_cells -quiet [list L1/sw3]]
resize_pblock [get_pblocks pblock_sw3] -add {SLICE_X54Y415:SLICE_X65Y434}
resize_pblock [get_pblocks pblock_sw3] -add {DSP48_X3Y166:DSP48_X4Y173}
resize_pblock [get_pblocks pblock_sw3] -add {RAMB18_X4Y166:RAMB18_X4Y173}
resize_pblock [get_pblocks pblock_sw3] -add {RAMB36_X4Y83:RAMB36_X4Y86}
create_pblock pblock_sw1_1
add_cells_to_pblock [get_pblocks pblock_sw1_1] [get_cells -quiet [list L2/sw1]]
resize_pblock [get_pblocks pblock_sw1_1] -add {SLICE_X82Y415:SLICE_X97Y434}
create_pblock pblock_sw2_1
add_cells_to_pblock [get_pblocks pblock_sw2_1] [get_cells -quiet [list L2/sw2]]
resize_pblock [get_pblocks pblock_sw2_1] -add {SLICE_X102Y415:SLICE_X111Y434}
resize_pblock [get_pblocks pblock_sw2_1] -add {DSP48_X6Y166:DSP48_X7Y173}
create_pblock pblock_sw3_1
add_cells_to_pblock [get_pblocks pblock_sw3_1] [get_cells -quiet [list L2/sw3]]
resize_pblock [get_pblocks pblock_sw3_1] -add {SLICE_X116Y415:SLICE_X127Y434}
resize_pblock [get_pblocks pblock_sw3_1] -add {DSP48_X8Y166:DSP48_X9Y173}
create_pblock pblock_sw1_2
add_cells_to_pblock [get_pblocks pblock_sw1_2] [get_cells -quiet [list CH/sw1]]
resize_pblock [get_pblocks pblock_sw1_2] -add {SLICE_X36Y384:SLICE_X51Y404}
resize_pblock [get_pblocks pblock_sw1_2] -add {DSP48_X2Y154:DSP48_X2Y161}
resize_pblock [get_pblocks pblock_sw1_2] -add {RAMB18_X3Y154:RAMB18_X3Y161}
resize_pblock [get_pblocks pblock_sw1_2] -add {RAMB36_X3Y77:RAMB36_X3Y80}
create_pblock pblock_sw2_2
add_cells_to_pblock [get_pblocks pblock_sw2_2] [get_cells -quiet [list CH/sw2]]
resize_pblock [get_pblocks pblock_sw2_2] -add {SLICE_X102Y384:SLICE_X113Y403}
resize_pblock [get_pblocks pblock_sw2_2] -add {DSP48_X7Y154:DSP48_X7Y159}
create_pblock pblock_sw1_3
add_cells_to_pblock [get_pblocks pblock_sw1_3] [get_cells -quiet [list L3/sw1]]
resize_pblock [get_pblocks pblock_sw1_3] -add {SLICE_X12Y355:SLICE_X29Y375}
resize_pblock [get_pblocks pblock_sw1_3] -add {RAMB18_X1Y142:RAMB18_X1Y149}
resize_pblock [get_pblocks pblock_sw1_3] -add {RAMB36_X1Y71:RAMB36_X1Y74}
create_pblock pblock_sw2_3
add_cells_to_pblock [get_pblocks pblock_sw2_3] [get_cells -quiet [list L3/sw2]]
resize_pblock [get_pblocks pblock_sw2_3] -add {SLICE_X34Y355:SLICE_X51Y375}
resize_pblock [get_pblocks pblock_sw2_3] -add {DSP48_X2Y142:DSP48_X2Y149}
resize_pblock [get_pblocks pblock_sw2_3] -add {RAMB18_X3Y142:RAMB18_X3Y149}
resize_pblock [get_pblocks pblock_sw2_3] -add {RAMB36_X3Y71:RAMB36_X3Y74}
create_pblock pblock_sw3_2
add_cells_to_pblock [get_pblocks pblock_sw3_2] [get_cells -quiet [list L3/sw3]]
resize_pblock [get_pblocks pblock_sw3_2] -add {SLICE_X52Y355:SLICE_X65Y375}
resize_pblock [get_pblocks pblock_sw3_2] -add {DSP48_X3Y142:DSP48_X4Y149}
resize_pblock [get_pblocks pblock_sw3_2] -add {RAMB18_X4Y142:RAMB18_X4Y149}
resize_pblock [get_pblocks pblock_sw3_2] -add {RAMB36_X4Y71:RAMB36_X4Y74}
create_pblock pblock_sw1_4
add_cells_to_pblock [get_pblocks pblock_sw1_4] [get_cells -quiet [list L4/sw1]]
resize_pblock [get_pblocks pblock_sw1_4] -add {SLICE_X82Y355:SLICE_X97Y375}
create_pblock pblock_sw2_4
add_cells_to_pblock [get_pblocks pblock_sw2_4] [get_cells -quiet [list L4/sw2]]
resize_pblock [get_pblocks pblock_sw2_4] -add {SLICE_X102Y355:SLICE_X113Y375}
resize_pblock [get_pblocks pblock_sw2_4] -add {DSP48_X7Y142:DSP48_X7Y149}
create_pblock pblock_sw3_3
add_cells_to_pblock [get_pblocks pblock_sw3_3] [get_cells -quiet [list L4/sw3]]
resize_pblock [get_pblocks pblock_sw3_3] -add {SLICE_X116Y355:SLICE_X127Y375}
resize_pblock [get_pblocks pblock_sw3_3] -add {DSP48_X8Y142:DSP48_X9Y149}
