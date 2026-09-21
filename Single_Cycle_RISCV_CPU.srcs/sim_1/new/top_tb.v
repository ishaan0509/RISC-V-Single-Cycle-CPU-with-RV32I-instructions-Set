`timescale 1ns/1ns

module top_tb ();

    reg clk, rst;
    integer i;
    
    top DUT(.clk(clk), .rst(rst));

    initial begin
        // clear memory just in case
        for (i = 0; i < 64; i = i + 1)
            DUT.inst_mem.mem[i] = 32'b0;
        
        // load instructions
        $readmemh(
            "C:/VivadoProjects/Single_Cycle_RISCV_CPU/Single_Cycle_RISCV_CPU.srcs/sources_1/new/test/test.hex",
            DUT.inst_mem.mem
        );
    end

    initial begin
        clk = 0;
        rst = 1;
        #15
        rst = 0;
    end

    always begin
        #5 clk = ~clk;
    end

    initial begin
        $dumpfile("top_tb.vcd");
        $dumpvars(0, top_tb);

        #1000
        $finish;
    end

   always @(posedge clk) begin
    $display(
        "TIME=%0t | PC=%h | INST=%h | ALUOp=%b | func7=%b | func3=%b | ALU_CTRL=%b | ALU_A=%0d | ALU_B=%0d | ALU_OUT=%0d",
        $time,
        DUT.PC.PC_out,
        DUT.instruction_top,
        DUT.ALUOp_top,
        DUT.instruction_top[30],
        DUT.instruction_top[14:12],
        DUT.ALU_ctrl_top,
        DUT.RD1_top,
        DUT.ALU_mux_out_top,
        DUT.ALU_out_top
    );
end

endmodule
