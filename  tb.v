module tb; 
  reg [3:0] a, b;        
  reg load, clk, rst_a;   
  wire [7:0] op;          
  wire ready_out;         
  seq_mul DUT ( 
    .op(op), 
    .ready_out(ready_out), 
    .a(a), 
    .b(b), 
    .load(load), 
    .clk(clk), 
    .rst_a(rst_a) 
  ); 
  always #5 clk = ~clk; 
  initial begin 
    rst_a = 1; 
    load = 0; 
    a = 4'b0000; 
    b = 4'b0000; 
    clk = 0; 
    #10 rst_a = 0;  
    load = 1; 
    #10 a = 4'b0010;   
    b = 4'b0011;   
    #10 load = 0;  
    #50;  
    #10 load = 1; 
    #10 a = 4'b0011;   
    b = 4'b0011;   
    #10 load = 0; 
    #50;  
    $finish;   
  end 
endmodule 