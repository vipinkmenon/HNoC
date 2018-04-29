create_clock -period 5.000 -name i_sclk -waveform {0.000 2.500} [get_ports i_sclk]
create_clock -period 4.000 -name i_mclk -waveform {0.000 2.000} [get_ports i_mclk]
