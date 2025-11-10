class fifo_environment extends uvm_env;
  `uvm_component_utils(fifo_environment);

  fifo_agent fifo_agnt;
  fifo_read_agent fifo_read_agnt;
  fifo_virtual_sequencer fifo_virtual_seqr;

  function new(string name="fifo_environment", uvm_component parent);
    super.new(name,parent);
  endfunction : new

  virtual function void build_phase(uvm_phase phase);
    fifo_agnt = fifo_agent::type_id::create("fifo_agnt",this);
    fifo_read_agnt = fifo_read_agent::type_id::create("fifo_read_agnt",this);
    fifo_virtual_seqr = fifo_virtual_sequencer::type_id::create("fifo_virtual_seqr",this);
  endfunction : build_phase 

  virtual function void connect_phase(uvm_phase phase);
    fifo_virtual_seqr.fifo_seqr      = fifo_agnt.fifo_seqr;
    fifo_virtual_seqr.fifo_read_seqr = fifo_read_agnt.fifo_seqr;
  endfunction : connect_phase


endclass : fifo_environment