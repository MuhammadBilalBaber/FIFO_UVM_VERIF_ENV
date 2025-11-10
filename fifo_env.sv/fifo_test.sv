class fifo_test extends uvm_test;
  `uvm_component_utils(fifo_test);

  fifo_environment fifo_env;
  fifo_virtual_sequence fifo_vitrual_seq;

  function new(string name="fifo_test", uvm_component parent);
    super.new(name,parent);
  endfunction : new

  virtual function void build_phase(uvm_phase phase);
    fifo_env = fifo_environment::type_id::create("fifo_env",this);
    fifo_vitrual_seq = fifo_virtual_sequence::type_id::create("fifo_vitrual_seq",this);
  endfunction : build_phase

  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    phase.raise_objection(this);
     fifo_vitrual_seq.start(fifo_env.fifo_virtual_seqr);
    phase.drop_objection(this);
  endtask : run_phase


endclass : fifo_test