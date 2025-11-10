module fifo #(parameter DATA_WIDTH = 8, parameter ADDRESS_WIDTH=4)(
  input  wire  clk,
  input  wire  reset,
  input  wire  rd_en,
  input  wire  wr_en,
  input  wire  [DATA_WIDTH-1:0] data_in,
  output reg   [DATA_WIDTH-1:0] data_out,
  output reg  empty,
  output reg  full
  );

  reg [DATA_WIDTH-1:0] fifo_mem [2**ADDRESS_WIDTH-1:0];
  reg [ADDRESS_WIDTH:0] wr_ptr;
  reg [ADDRESS_WIDTH:0] rd_ptr; 
  integer i;

  always @(*) begin
    if(reset) begin
      data_out <= 'h0;
      empty    <= 'h1;
      full     <= 'h0; 
      wr_ptr   <= 'h0;
      rd_ptr   <= 'h0;
    end
  end

  /********************************/
  /*         WRITE-LOGIC          */
  /********************************/

  always @(posedge clk) begin
    if(!reset) begin
      if(!full && wr_en) begin
        fifo_mem[wr_ptr] <= data_in;
        wr_ptr           <= wr_ptr + 1;
      end
    end
  end

  /********************************/
  /*         READ-LOGIC           */
  /********************************/

  always @(posedge clk) begin
    if(!reset) begin
      if(!empty && rd_en) begin
        data_out <= fifo_mem[rd_ptr];
        rd_ptr   <= rd_ptr + 1;
      end
    end
  end

  /********************************/
  /*     WRITE-PTR-LOGIC          */
  /********************************/

  always @(posedge clk) begin
    if(!reset) begin
      if(wr_ptr == 2**ADDRESS_WIDTH && !full && wr_en) begin
        wr_ptr  <= 'h0;
      end
    end
  end

  /********************************/
  /*     READ-PTR-LOGIC          */
  /********************************/

  always @(posedge clk) begin
    if(!reset) begin
      if(rd_ptr == 2**ADDRESS_WIDTH && !empty && rd_en) begin
        rd_ptr <= 'h0;
      end
    end
  end

  /********************************/
  /*        FULL-EMPTY-LOGIC      */
  /********************************/
 
  always @(posedge clk) begin
    if(!reset) begin
      empty <= (wr_ptr == rd_ptr) ? 1'b1 : 1'b0;
    end 
  end
  
  always @(posedge clk) begin
    if(!reset) begin
      full  <= ((wr_ptr-rd_ptr == 2**ADDRESS_WIDTH)|(rd_ptr-wr_ptr == 2**ADDRESS_WIDTH)) ? 1'b1 : 1'b0;
    end
  end


endmodule 