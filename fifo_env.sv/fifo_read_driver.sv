class fifo_read_driver extends uvm_driver #(fifo_seq_item);
  `uvm_component_utils(fifo_read_driver);

  function new(string name = "fifo_read_driver", uvm_component parent);
    super.new(name , parent);
  endfunction : new

  virtual fifo_interface fifo_read_intf;

  virtual function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    req = fifo_seq_item::type_id::create("req",this); 
    if(! uvm_config_db #(virtual fifo_interface) :: get (this ,"*","fifo_read_intf",fifo_read_intf))
      `uvm_fatal(get_type_name(),"Didn't get the interface instance in DRIVER")
  endfunction : build_phase

  virtual task run_phase(uvm_phase phase);
    wait(!fifo_read_intf.reset);
    forever begin
      seq_item_port.get_next_item(req);
        fifo_read();
      seq_item_port.item_done();
    end
  endtask : run_phase

  virtual task fifo_read();
     if(req.rd_en) begin
     fifo_read_intf.rd_en <= req.rd_en;
     fifo_read_intf.wr_en <= req.wr_en;
     fifo_read_intf.data_in <= req.data_write;
     @(posedge fifo_read_intf.clk);
     fifo_read_intf.rd_en <= 0;
     @(posedge fifo_read_intf.clk);
     end
  endtask : fifo_read

endclass : fifo_read_driver