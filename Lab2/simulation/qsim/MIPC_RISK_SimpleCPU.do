onerror {exit -code 1}
vlib work
vlog -work work MIPC_RISK_SimpleCPU.vo
vlog -work work component_test.vwf.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.top_level_vlg_vec_tst -voptargs="+acc"
vcd file -direction MIPC_RISK_SimpleCPU.msim.vcd
vcd add -internal top_level_vlg_vec_tst/*
vcd add -internal top_level_vlg_vec_tst/i1/*
run -all
quit -f
