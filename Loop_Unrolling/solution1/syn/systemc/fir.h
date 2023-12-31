// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2019.1
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#ifndef _fir_HH_
#define _fir_HH_

#include "systemc.h"
#include "AESL_pkg.h"


namespace ap_rtl {

struct fir : public sc_module {
    // Port declarations 7
    sc_in< sc_logic > ap_start;
    sc_out< sc_logic > ap_done;
    sc_out< sc_logic > ap_idle;
    sc_out< sc_logic > ap_ready;
    sc_out< sc_lv<32> > output_r;
    sc_out< sc_logic > output_r_ap_vld;
    sc_in< sc_lv<32> > input_r;
    // Port declarations for the virtual clock. 
    sc_in_clk ap_virtual_clock;


    // Module declarations
    fir(sc_module_name name);
    SC_HAS_PROCESS(fir);

    ~fir();

    sc_trace_file* mVcdFile;

    ofstream mHdltvinHandle;
    ofstream mHdltvoutHandle;
    sc_signal< sc_lv<32> > acc_fu_29_p0;
    static const sc_logic ap_const_logic_1;
    static const bool ap_const_boolean_1;
    static const sc_logic ap_const_logic_0;
    static const sc_lv<32> ap_const_lv32_35;
    // Thread declarations
    void thread_acc_fu_29_p0();
    void thread_ap_done();
    void thread_ap_idle();
    void thread_ap_ready();
    void thread_output_r();
    void thread_output_r_ap_vld();
    void thread_hdltv_gen();
};

}

using namespace ap_rtl;

#endif
