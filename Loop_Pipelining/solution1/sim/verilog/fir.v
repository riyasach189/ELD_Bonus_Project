// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2019.1
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="fir,hls_ip_2019_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020-clg484-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=8.510000,HLS_SYN_LAT=11,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=2,HLS_SYN_FF=73,HLS_SYN_LUT=110,HLS_VERSION=2019_1}" *)

module fir (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        output_r,
        output_r_ap_vld,
        input_r
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_state2 = 3'd2;
parameter    ap_ST_fsm_state3 = 3'd4;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [31:0] output_r;
output   output_r_ap_vld;
input  [31:0] input_r;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg output_r_ap_vld;

(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [2:0] shift_reg_address0;
reg    shift_reg_ce0;
reg    shift_reg_we0;
reg   [31:0] shift_reg_d0;
wire   [31:0] shift_reg_q0;
wire   [2:0] i_fu_86_p2;
reg   [2:0] i_reg_117;
wire    ap_CS_fsm_state2;
wire   [0:0] icmp_ln16_fu_80_p2;
reg   [2:0] i_0_reg_68;
wire    ap_CS_fsm_state3;
wire   [63:0] zext_ln18_fu_92_p1;
wire   [63:0] zext_ln18_1_fu_103_p1;
wire  signed [31:0] acc_fu_97_p0;
reg   [2:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_CS_fsm = 3'd1;
end

fir_shift_reg #(
    .DataWidth( 32 ),
    .AddressRange( 6 ),
    .AddressWidth( 3 ))
shift_reg_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(shift_reg_address0),
    .ce0(shift_reg_ce0),
    .we0(shift_reg_we0),
    .d0(shift_reg_d0),
    .q0(shift_reg_q0)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        i_0_reg_68 <= i_reg_117;
    end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        i_0_reg_68 <= 3'd5;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln16_fu_80_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        i_reg_117 <= i_fu_86_p2;
    end
end

always @ (*) begin
    if (((icmp_ln16_fu_80_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln16_fu_80_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln16_fu_80_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        output_r_ap_vld = 1'b1;
    end else begin
        output_r_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        shift_reg_address0 = zext_ln18_1_fu_103_p1;
    end else if (((icmp_ln16_fu_80_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        shift_reg_address0 = 3'd0;
    end else if (((icmp_ln16_fu_80_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        shift_reg_address0 = zext_ln18_fu_92_p1;
    end else begin
        shift_reg_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | ((icmp_ln16_fu_80_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2)) | ((icmp_ln16_fu_80_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2)))) begin
        shift_reg_ce0 = 1'b1;
    end else begin
        shift_reg_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        shift_reg_d0 = shift_reg_q0;
    end else if (((icmp_ln16_fu_80_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        shift_reg_d0 = input_r;
    end else begin
        shift_reg_d0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | ((icmp_ln16_fu_80_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2)))) begin
        shift_reg_we0 = 1'b1;
    end else begin
        shift_reg_we0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((icmp_ln16_fu_80_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state2;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign acc_fu_97_p0 = input_r;

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign i_fu_86_p2 = ($signed(i_0_reg_68) + $signed(3'd7));

assign icmp_ln16_fu_80_p2 = ((i_0_reg_68 == 3'd0) ? 1'b1 : 1'b0);

assign output_r = ($signed(acc_fu_97_p0) * $signed('h35));

assign zext_ln18_1_fu_103_p1 = i_0_reg_68;

assign zext_ln18_fu_92_p1 = i_fu_86_p2;

endmodule //fir
