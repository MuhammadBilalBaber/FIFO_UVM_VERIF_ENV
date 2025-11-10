`include "uvm_macros.svh"
import uvm_pkg::*;
module fifo_tb_top;
  bit clk;
  bit reset;

  always #0.5ns clk = ~clk ;

  fifo_interface #(.DATA_WIDTH(32),.ADDRESS_WIDTH(3)) fifo_intf(clk,reset);

  `ifdef DATA_WIDTH
  `else 
    `define DATA_WIDTH 8
  `endif

  `ifdef ADDRESS_WIDTH
  `else 
     `define ADDRESS_WIDTH 4
  `endif

  int DATA_WID = `DATA_WIDTH;
  int ADDRESS_WID = `ADDRESS_WIDTH;

  fifo #(.DATA_WIDTH(32), .ADDRESS_WIDTH(3))fifo_inst(
    .clk     (clk),
    .reset   (reset),
    .rd_en   (fifo_intf.rd_en),
    .wr_en   (fifo_intf.wr_en),
    .data_in (fifo_intf.data_in),
    .data_out(fifo_intf.data_out),
    .empty   (fifo_intf.empty),
    .full    (fifo_intf.full)
    );

  initial begin
    reset = 1'b1;
    repeat(2) begin
      @(posedge clk);
    end
    reset = 1'b0;
  end

  initial begin
    uvm_config_db#(virtual fifo_interface)::set(null,"uvm_test_top.*","fifo_intf",fifo_intf);
    uvm_config_db#(virtual fifo_interface)::set(null,"uvm_test_top.*","fifo_read_intf",fifo_intf);
    run_test("fifo_test");
  end



endmodule : fifo_tb_top