class fifo_read_monitor extends uvm_monitor;
  `uvm_component_utils(fifo_read_monitor);

  virtual fifo_interface fifo_read_intf;
  fifo_seq_item req;

  function new(string name="fifo_read_monitor", uvm_component parent);
    super.new(name, parent);
  endfunction : new

  virtual function void build_phase (uvm_phase phase);
    super.build_phase(phase);

    if(!uvm_config_db #(virtual fifo_interface) :: get(this,"*","fifo_read_intf",fifo_read_intf))
      `uvm_fatal(get_type_name(),"Didn't get the interface instance in the monitor class")

  endfunction : build_phase

  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    wait(!fifo_read_intf.reset);
    forever begin
      monitor_transaction();
    end
  endtask : run_phase

  task monitor_transaction();
    req = fifo_seq_item::type_id::create("req");
    repeat(1) begin
      @(posedge fifo_read_intf.clk);
    end
    if(fifo_read_intf.rd_en) begin
     req.rd_en <= fifo_read_intf.rd_en;
     req.wr_en <= fifo_read_intf.wr_en;
     req.data_write <= fifo_read_intf.data_in;
     req.data_read  <= fifo_read_intf.data_out;
     req.empty      <= fifo_read_intf.empty;
     req.full       <= fifo_read_intf.full;
     repeat(1) begin
       @(posedge fifo_read_intf.clk);
     end


     `uvm_info(get_type_name(),$sformatf("The rd_en is %0h",req.rd_en),UVM_LOW);
     `uvm_info(get_type_name(),$sformatf("The wr_en is %0h", req.wr_en),UVM_LOW);
     `uvm_info(get_type_name(),$sformatf("The data_write is %0h", req.data_write),UVM_LOW);
     `uvm_info(get_type_name(),$sformatf("The data_read is %0h", fifo_read_intf.data_out),UVM_LOW);
     `uvm_info(get_type_name(),$sformatf("The empty is %0h", req.empty),UVM_LOW);
     `uvm_info(get_type_name(),$sformatf("The full is %0h", req.full),UVM_LOW);
      req.print();
   end

  endtask : monitor_transaction


endclass : fifo_read_monitor