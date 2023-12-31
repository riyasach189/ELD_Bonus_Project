// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2019.1
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="fir,hls_ip_2019_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=1,HLS_INPUT_PART=xc7z020-clg484-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=3.740000,HLS_SYN_LAT=0,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=0,HLS_SYN_LUT=26,HLS_VERSION=2019_1}" *)

module fir (
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        output_V,
        output_V_ap_vld,
        input_V
);


input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [22:0] output_V;
output   output_V_ap_vld;
input  [2:0] input_V;

reg output_V_ap_vld;

wire  signed [2:0] ret_V_fu_33_p0;
wire   [9:0] ret_V_fu_33_p2;

always @ (*) begin
    if ((ap_start == 1'b1)) begin
        output_V_ap_vld = 1'b1;
    end else begin
        output_V_ap_vld = 1'b0;
    end
end

assign ap_done = ap_start;

assign ap_idle = 1'b1;

assign ap_ready = ap_start;

assign output_V = $signed(ret_V_fu_33_p2);

assign ret_V_fu_33_p0 = input_V;

assign ret_V_fu_33_p2 = ($signed(ret_V_fu_33_p0) * $signed('h35));

endmodule //fir
