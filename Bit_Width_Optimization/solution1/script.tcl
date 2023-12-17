############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
############################################################
open_project Bit_Width_Optimization
set_top fir
add_files Bit_Width_Optimization/top.cpp
add_files -tb Bit_Width_Optimization/tb.cpp
open_solution "solution1"
set_part {xc7z020clg484-1} -tool vivado
create_clock -period 10 -name default
set_clock_uncertainty 1.25
#source "./Bit_Width_Optimization/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
