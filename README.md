**DUT SPECIFICATION:**
FIFO definition 

The DUT is FIFO memory that acts as a buffer for data transfer between 2 synchronous and independent blocks. When the block generating data has data to send, it puts the data on data_in bus and initiates write operation by asserting wr_en control signal. When block consuming the data is ready to read, it asserts rd_en control signal and samples the data from data_out bus. Data are read from the buffer in the order in which they are written.
