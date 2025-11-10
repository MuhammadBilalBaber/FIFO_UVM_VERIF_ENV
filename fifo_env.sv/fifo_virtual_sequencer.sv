class fifo_virtual_sequencer extends uvm_sequencer ;
  `uvm_component_utils(fifo_virtual_sequencer);

  fifo_sequencer fifo_seqr;
  fifo_read_sequencer fifo_read_seqr;

  function new(string name = "fifo_virtual_sequencer", uvm_component parent);
    super.new(name,parent);
  endfunction

endclass