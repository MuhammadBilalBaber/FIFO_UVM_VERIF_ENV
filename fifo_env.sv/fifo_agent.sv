class fifo_agent extends uvm_agent;
  `uvm_component_utils(fifo_agent);

  fifo_sequencer fifo_seqr;
  fifo_driver    fifo_drv;
  fifo_monitor   fifo_montr;

  function new(string name="fifo_agent", uvm_component parent);
    super.new(name, parent);
  endfunction : new

  virtual function void build_phase(uvm_phase phase);
    fifo_seqr  = fifo_sequencer::type_id::create("fifo_seqr",this);
    fifo_drv   = fifo_driver::type_id::create("fifo_drv",this);
    fifo_montr = fifo_monitor::type_id::create("fifo_montr",this);
  endfunction : build_phase 

  virtual function void connect_phase(uvm_phase phase);
    fifo_drv.seq_item_port.connect(fifo_seqr.seq_item_export);
  endfunction : connect_phase



endclass : fifo_agent