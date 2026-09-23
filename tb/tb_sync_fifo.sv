`timescale 1ns/1ps

module tb_sync_fifo;
// Parameters
localparam int DATA_WIDTH =8;
localparam int DEPTH = 16;

// Testbench signals
logic clk;
logic rst_n;

logic wr_en;
logic [DATA_WIDTH-1:0] wr_data;

logic rd_en;
logic [DATA_WIDTH-1:0] rd_data;

logic full;
logic empty;

// DUT
sync_fifo #(
    .DATA_WIDTH(DATA_WIDTH),
    .DEPTH(DEPTH)
) dut (
    .clk(clk),
    .rst_n(rst_n),
    .wr_en(wr_en),
    .wr_data(wr_data),
    .rd_en(rd_en),
    .rd_data(rd_data),
    .full(full),
    .empty(empty)
);

// Clock generation

initial begin
    clk = 1'b0;

    forever #5 clk = ~clk;
end

// Test sequence

initial begin

    // initial values 
    rst_n = 1'b0;
    wr_en = 1'b0;
    wr_data = '0;
    rd_en = 1'b0;

    // Reset
    #20;

    rst_n = 1'b1;

    // Write 3 values

    @(negedge clk);
    wr_en = 1'b1;
    wr_data = 8'h11;

    @(negedge clk);
    wr_data = 8'h22;

    @(negedge clk);
    wr_data = 8'h33;

    @(negedge clk);
    wr_en = 1'b0;

    // Read 2 values
    @(negedge clk);
    rd_en = 1'b1;

    @(negedge clk);

    @(negedge clk); 

    @(negedge clk);
    rd_en = 1'b0;

    //Finish simulation
    #20;
    $finish;
end
endmodule

