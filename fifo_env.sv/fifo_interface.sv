interface fifo_interface #(parameter DATA_WIDTH = 8, parameter ADDRESS_WIDTH = 4) (input logic clk, input logic reset);
 logic rd_en;
 logic wr_en;
 logic [DATA_WIDTH-1:0] data_in;
 logic [DATA_WIDTH-1:0] data_out;
 logic empty;
 logic full;
endinterface 