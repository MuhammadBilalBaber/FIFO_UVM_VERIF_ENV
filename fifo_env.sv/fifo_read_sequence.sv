class fifo_read_sequence extends uvm_sequence#(fifo_seq_item);
  `uvm_object_utils(fifo_read_sequence)

  function new(string name="fifo_read_sequence");
    super.new(name);
  endfunction : new

  virtual task body();
   fifo_read_seq();
  endtask : body

  virtual task fifo_read_seq();
    repeat(3) begin
     req= fifo_seq_item::type_id::create("req");
     start_item(req);
     assert(req.randomize() with {
      req.rd_en == 1'b1;
      req.wr_en == 1'b0;  
      });
     finish_item(req);
    end
  endtask : fifo_read_seq

endclass : fifo_read_sequence