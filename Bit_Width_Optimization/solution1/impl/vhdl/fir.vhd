-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2019.1
-- Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fir is
port (
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    output_V : OUT STD_LOGIC_VECTOR (22 downto 0);
    output_V_ap_vld : OUT STD_LOGIC;
    input_V : IN STD_LOGIC_VECTOR (2 downto 0) );
end;


architecture behav of fir is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "fir,hls_ip_2019_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=1,HLS_INPUT_PART=xc7z020-clg484-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=3.740000,HLS_SYN_LAT=0,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=0,HLS_SYN_LUT=26,HLS_VERSION=2019_1}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_const_lv10_35 : STD_LOGIC_VECTOR (9 downto 0) := "0000110101";

    signal ret_V_fu_33_p0 : STD_LOGIC_VECTOR (2 downto 0);
    signal ret_V_fu_33_p2 : STD_LOGIC_VECTOR (9 downto 0);


begin



    ap_done <= ap_start;
    ap_idle <= ap_const_logic_1;
    ap_ready <= ap_start;
        output_V <= std_logic_vector(IEEE.numeric_std.resize(signed(ret_V_fu_33_p2),23));


    output_V_ap_vld_assign_proc : process(ap_start)
    begin
        if ((ap_start = ap_const_logic_1)) then 
            output_V_ap_vld <= ap_const_logic_1;
        else 
            output_V_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    ret_V_fu_33_p0 <= input_V;
    ret_V_fu_33_p2 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(std_logic_vector(signed(ret_V_fu_33_p0) * signed('0' &ap_const_lv10_35))), 10));
end behav;