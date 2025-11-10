class fifo_virtual_sequence extends uvm_sequence#(fifo_seq_item);
  `uvm_object_utils(fifo_virtual_sequence)

  fifo_sequence fifo_seq;
  fifo_read_sequence fifo_read_seq;

  function new(string name = "fifo_virtual_sequence");
    super.new(name);
  endfunction : new

  `uvm_declare_p_sequencer(fifo_virtual_sequencer);

  task pre_body();
    fifo_seq = fifo_sequence::type_id::create("fifo_seq");
    fifo_read_seq = fifo_read_sequence::type_id::create("fifo_read_seq");
  endtask : pre_body

  task body();
    fifo_seq.start(p_sequencer.fifo_seqr);
    fifo_read_seq.start(p_sequencer.fifo_read_seqr);
  endtask : body

endclass : fifo_virtual_sequence