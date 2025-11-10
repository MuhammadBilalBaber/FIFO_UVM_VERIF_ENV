**DUT SPECIFICATION:**
FIFO definition 

The DUT is FIFO memory that acts as a buffer for data transfer between 2 synchronous and independent blocks. When the block generating data has data to send, it puts the data on data_in bus and initiates write operation by asserting wr_en control signal. When block consuming the data is ready to read, it asserts rd_en control signal and samples the data from data_out bus. Data are read from the buffer in the order in which they are written.

**Write operation **

The FIFO stores the value from data_in bus into first free memory location on every rising clock edge if 

wr_en is active. If the memory is full, the write operation will be ignored. 

 

**Read operation**

The FIFO puts data from memory location that is written first on data_out bus on every rising clock edge if 

rd_en is asserted. If the memory is empty, the read operation will be ignored. 

 

**Flags **

Full flag (full output signal) is indication to the block generating data that memory is full. The signal is asserted on the same clock edge on which the data is written to the last free location of the memory. It stays active until first read operation – it is de-asserted on the same clock edge on which the data is read from full memory. 

Empty flag (empty output signal) is indication to the block consuming data that memory is empty. The signal is asserted on the same clock edge on which the last data is read from the memory. It stays active until first write operation – it is de-asserted on the same clock edge on which the data is written to empty memory. 

**Reset **

Reset takes the FIFO to initial state – memory is empty and all outputs get corresponding values. It is done asynchronously – FIFO doesn’t need the clock to get reset. FIFO stays in initial state and ignores all the operations while the reset is active.


