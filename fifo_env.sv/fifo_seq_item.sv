class fifo_seq_item extends uvm_sequence_item;

  // `define DATA_WIDTH 8

  `ifdef DATA_WIDTH
  `else 
    `define DATA_WIDTH 8
  `endif
  rand logic rd_en;
  rand logic wr_en;
  rand logic [`DATA_WIDTH-1:0] data_write;
  logic [`DATA_WIDTH-1:0] data_read;
  logic empty;
  logic full;

  `uvm_object_utils_begin(fifo_seq_item)
     `uvm_field_int(rd_en, UVM_ALL_ON);
     `uvm_field_int(wr_en, UVM_ALL_ON);
     `uvm_field_int(data_write, UVM_ALL_ON);
     `uvm_field_int(data_read, UVM_ALL_ON);
     `uvm_field_int(empty, UVM_ALL_ON);
     `uvm_field_int(full, UVM_ALL_ON);
  `uvm_object_utils_end

  function new(string name="fifo_seq_item");
     super.new(name);
  endfunction 

endclass