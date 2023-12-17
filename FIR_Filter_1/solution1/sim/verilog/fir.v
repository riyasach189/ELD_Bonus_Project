// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2019.1
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="fir,hls_ip_2019_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020-clg484-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=8.510000,HLS_SYN_LAT=34,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=4,HLS_SYN_FF=287,HLS_SYN_LUT=233,HLS_VERSION=2019_1}" *)

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

parameter    ap_ST_fsm_state1 = 5'd1;
parameter    ap_ST_fsm_state2 = 5'd2;
parameter    ap_ST_fsm_state3 = 5'd4;
parameter    ap_ST_fsm_state4 = 5'd8;
parameter    ap_ST_fsm_state5 = 5'd16;

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

(* fsm_encoding = "none" *) reg   [4:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [3:0] shift_reg_address0;
reg    shift_reg_ce0;
reg    shift_reg_we0;
reg   [31:0] shift_reg_d0;
wire   [31:0] shift_reg_q0;
wire   [3:0] c1_address0;
reg    c1_ce0;
wire   [9:0] c1_q0;
wire   [31:0] mul_ln19_fu_134_p2;
reg   [31:0] mul_ln19_reg_187;
wire   [0:0] icmp_ln17_fu_152_p2;
reg   [0:0] icmp_ln17_reg_195;
wire    ap_CS_fsm_state2;
wire   [0:0] tmp_fu_144_p3;
wire   [63:0] zext_ln25_1_fu_163_p1;
reg   [63:0] zext_ln25_1_reg_204;
reg  signed [31:0] shift_reg_load_reg_214;
wire    ap_CS_fsm_state3;
reg   [9:0] c1_load_reg_219;
wire   [31:0] mul_ln26_fu_171_p2;
reg   [31:0] mul_ln26_reg_224;
wire    ap_CS_fsm_state4;
wire   [31:0] acc_fu_176_p2;
wire    ap_CS_fsm_state5;
wire   [4:0] grp_fu_127_p2;
reg   [31:0] acc_0_reg_93;
wire  signed [4:0] ap_phi_mux_i_0_phi_fu_110_p4;
reg  signed [4:0] i_0_reg_106;
reg   [31:0] ap_phi_mux_p_pn_phi_fu_121_p4;
reg   [31:0] p_pn_reg_118;
wire   [63:0] zext_ln25_fu_158_p1;
reg  signed [4:0] grp_fu_127_p0;
wire  signed [31:0] mul_ln19_fu_134_p0;
wire  signed [31:0] sext_ln15_fu_140_p1;
wire  signed [9:0] mul_ln26_fu_171_p1;
reg   [4:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_CS_fsm = 5'd1;
end

fir_shift_reg #(
    .DataWidth( 32 ),
    .AddressRange( 11 ),
    .AddressWidth( 4 ))
shift_reg_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(shift_reg_address0),
    .ce0(shift_reg_ce0),
    .we0(shift_reg_we0),
    .d0(shift_reg_d0),
    .q0(shift_reg_q0)
);

fir_c1 #(
    .DataWidth( 10 ),
    .AddressRange( 11 ),
    .AddressWidth( 4 ))
c1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(c1_address0),
    .ce0(c1_ce0),
    .q0(c1_q0)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        acc_0_reg_93 <= acc_fu_176_p2;
    end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        acc_0_reg_93 <= 32'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        i_0_reg_106 <= grp_fu_127_p2;
    end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        i_0_reg_106 <= 5'd10;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln17_reg_195 == 1'd0) & (1'b1 == ap_CS_fsm_state5))) begin
        p_pn_reg_118 <= mul_ln26_reg_224;
    end else if (((tmp_fu_144_p3 == 1'd0) & (icmp_ln17_fu_152_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        p_pn_reg_118 <= mul_ln19_reg_187;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        c1_load_reg_219 <= c1_q0;
        shift_reg_load_reg_214 <= shift_reg_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_fu_144_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        icmp_ln17_reg_195 <= icmp_ln17_fu_152_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        mul_ln19_reg_187 <= mul_ln19_fu_134_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        mul_ln26_reg_224 <= mul_ln26_fu_171_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_fu_144_p3 == 1'd0) & (icmp_ln17_fu_152_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        zext_ln25_1_reg_204[31 : 0] <= zext_ln25_1_fu_163_p1[31 : 0];
    end
end

always @ (*) begin
    if (((tmp_fu_144_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
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
    if (((icmp_ln17_reg_195 == 1'd0) & (1'b1 == ap_CS_fsm_state5))) begin
        ap_phi_mux_p_pn_phi_fu_121_p4 = mul_ln26_reg_224;
    end else begin
        ap_phi_mux_p_pn_phi_fu_121_p4 = p_pn_reg_118;
    end
end

always @ (*) begin
    if (((tmp_fu_144_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        c1_ce0 = 1'b1;
    end else begin
        c1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        grp_fu_127_p0 = i_0_reg_106;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        grp_fu_127_p0 = ap_phi_mux_i_0_phi_fu_110_p4;
    end else begin
        grp_fu_127_p0 = 'bx;
    end
end

always @ (*) begin
    if (((tmp_fu_144_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        output_r_ap_vld = 1'b1;
    end else begin
        output_r_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        shift_reg_address0 = zext_ln25_1_reg_204;
    end else if (((tmp_fu_144_p3 == 1'd0) & (icmp_ln17_fu_152_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        shift_reg_address0 = 4'd0;
    end else if (((tmp_fu_144_p3 == 1'd0) & (icmp_ln17_fu_152_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        shift_reg_address0 = zext_ln25_fu_158_p1;
    end else begin
        shift_reg_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | ((tmp_fu_144_p3 == 1'd0) & (icmp_ln17_fu_152_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2)) | ((tmp_fu_144_p3 == 1'd0) & (icmp_ln17_fu_152_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2)))) begin
        shift_reg_ce0 = 1'b1;
    end else begin
        shift_reg_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        shift_reg_d0 = shift_reg_q0;
    end else if (((tmp_fu_144_p3 == 1'd0) & (icmp_ln17_fu_152_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        shift_reg_d0 = input_r;
    end else begin
        shift_reg_d0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | ((tmp_fu_144_p3 == 1'd0) & (icmp_ln17_fu_152_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2)))) begin
        shift_reg_we0 = 1'b1;
    end else begin
        shift_reg_we0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((tmp_fu_144_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else if (((tmp_fu_144_p3 == 1'd0) & (icmp_ln17_fu_152_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state2;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign acc_fu_176_p2 = (ap_phi_mux_p_pn_phi_fu_121_p4 + acc_0_reg_93);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_phi_mux_i_0_phi_fu_110_p4 = i_0_reg_106;

assign c1_address0 = zext_ln25_1_fu_163_p1;

assign grp_fu_127_p2 = ($signed(grp_fu_127_p0) + $signed(5'd31));

assign icmp_ln17_fu_152_p2 = ((i_0_reg_106 == 5'd0) ? 1'b1 : 1'b0);

assign mul_ln19_fu_134_p0 = input_r;

assign mul_ln19_fu_134_p2 = ($signed(mul_ln19_fu_134_p0) * $signed('h35));

assign mul_ln26_fu_171_p1 = c1_load_reg_219;

assign mul_ln26_fu_171_p2 = ($signed(shift_reg_load_reg_214) * $signed(mul_ln26_fu_171_p1));

assign output_r = acc_0_reg_93;

assign sext_ln15_fu_140_p1 = i_0_reg_106;

assign tmp_fu_144_p3 = i_0_reg_106[32'd4];

assign zext_ln25_1_fu_163_p1 = $unsigned(sext_ln15_fu_140_p1);

assign zext_ln25_fu_158_p1 = grp_fu_127_p2;

always @ (posedge ap_clk) begin
    zext_ln25_1_reg_204[63:32] <= 32'b00000000000000000000000000000000;
end

endmodule //fir
