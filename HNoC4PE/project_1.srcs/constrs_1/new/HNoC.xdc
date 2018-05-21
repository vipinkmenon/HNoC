create_clock -period 5.000 -name clk_100 -waveform {0.000 2.500} [get_ports clk_100]
create_clock -period 2.500 -name clk_200 -waveform {0.000 1.250} [get_ports clk_200]
