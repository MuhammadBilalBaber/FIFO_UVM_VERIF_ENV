**DUT SPECIFICATION:**

**FIFO definition**

The DUT is FIFO memory that acts as a buffer for data transfer between 2 synchronous and independent blocks. When the block generating data has data to send, it puts the data on data_in bus and initiates write operation by asserting wr_en control signal. When block consuming the data is ready to read, it asserts rd_en control signal and samples the data from data_out bus. Data are read from the buffer in the order in which they are written.

<img width="902" height="410" alt="image" src="https://github.com/user-attachments/assets/b5f0b25a-9d28-4f45-a804-f17ce43fea22" />


**Write operation**

The FIFO stores the value from data_in bus into first free memory location on every rising clock edge if 

wr_en is active. If the memory is full, the write operation will be ignored. 

 

**Read operation**

The FIFO puts data from memory location that is written first on data_out bus on every rising clock edge if 

rd_en is asserted. If the memory is empty, the read operation will be ignored. 

 

**Flags**

Full flag (full output signal) is indication to the block generating data that memory is full. The signal is asserted on the same clock edge on which the data is written to the last free location of the memory. It stays active until first read operation – it is de-asserted on the same clock edge on which the data is read from full memory. 

Empty flag (empty output signal) is indication to the block consuming data that memory is empty. The signal is asserted on the same clock edge on which the last data is read from the memory. It stays active until first write operation – it is de-asserted on the same clock edge on which the data is written to empty memory. 

**Reset**

Reset takes the FIFO to initial state – memory is empty and all outputs get corresponding values. It is done asynchronously – FIFO doesn’t need the clock to get reset. FIFO stays in initial state and ignores all the operations while the reset is active.

<img width="1257" height="820" alt="image" src="https://github.com/user-attachments/assets/5062aab2-734a-4ea4-908b-aaee50116596" />

**UVM ENVIRONMENT**

<img width="419" height="601" alt="image" src="https://github.com/user-attachments/assets/f6e9179c-744c-4bf9-ad9f-7563a4306e1b" />

https://app.diagrams.net/#G1sruRsnAkhjHeatTK8JoLUiF5qcEoz1PP#%7B%22pageId%22%3A%227QBoo4KrJyGAO9i6XJRv%22%7D




