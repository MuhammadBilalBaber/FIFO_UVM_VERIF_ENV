class fifo_sequence extends uvm_sequence#(fifo_seq_item);
  `uvm_object_utils(fifo_sequence)

  function new(string name="fifo_sequence");
    super.new(name);
  endfunction : new

  virtual task body();
   fifo_write_seq();
  endtask : body

  virtual task fifo_write_seq();
    repeat(1) begin
     req= fifo_seq_item::type_id::create("req");
     start_item(req);
     assert(req.randomize() with {
      req.rd_en == 1'b0;
      req.wr_en == 1'b1;
      req.data_write inside {[5:54673838]};
  
      });
     finish_item(req);
    end
  endtask : fifo_write_seq

endclass : fifo_sequence