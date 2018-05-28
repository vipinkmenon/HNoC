create_clock -period 1.250 -name clk_100 -waveform {0.000 0.6250} [get_ports clk_100]
create_clock -period 1.250 -name clk_200 -waveform {0.000 0.6250} [get_ports clk_200]
create_clock -period 1.250 -name clk_400 -waveform {0.000 0.6250} [get_ports clk_400]