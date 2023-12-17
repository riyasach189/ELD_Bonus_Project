############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
############################################################
open_project Loop_Fission
set_top fir
add_files Loop_Fission/top.h
add_files Loop_Fission/top.cpp
add_files -tb Loop_Fission/tb.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1"
set_part {xc7z020-clg484-1} -tool vivado
create_clock -period 10 -name default
set_clock_uncertainty 1.25
#source "./Loop_Fission/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
