class fifo_driver extends uvm_driver #(fifo_seq_item);
  `uvm_component_utils(fifo_driver);

  function new(string name = "fifo_driver", uvm_component parent);
    super.new(name , parent);
  endfunction : new

  virtual fifo_interface fifo_intf;

  virtual function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    req = fifo_seq_item::type_id::create("req",this); 
    if(! uvm_config_db #(virtual fifo_interface) :: get (this ,"*","fifo_intf",fifo_intf))
      `uvm_fatal(get_type_name(),"Didn't get the interface instance in DRIVER")
  endfunction : build_phase

  virtual task run_phase(uvm_phase phase);
    wait(!fifo_intf.reset);
    forever begin
      seq_item_port.get_next_item(req);
        fifo_write();
      seq_item_port.item_done();
    end
  endtask : run_phase

  virtual task fifo_write();
    
    if(req.wr_en) begin
      fifo_intf.rd_en <= req.rd_en;
      fifo_intf.wr_en <= req.wr_en;
      fifo_intf.data_in <= req.data_write;
      @(posedge fifo_intf.clk);
      fifo_intf.wr_en <= 0;
      @(posedge fifo_intf.clk);
    end
  endtask : fifo_write

endclass : fifo_driver