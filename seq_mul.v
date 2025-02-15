module seq_mul(op,ready_out,a,b,load,clk,rst_a); 
output reg [7:0] op; 
output reg ready_out; 
input [3:0] a,b; 
input load,clk,rst_a; 
reg [7:0] tmp0,tmp1,tmp2,tmp3; 
wire [7:0] tmp; 
assign tmp={4'b0000,b}; 
   always @(posedge rst_a,posedge clk) 
     begin  
 if (rst_a) 
   begin 
      op=8'b0000_0000; 
      ready_out=1'b0; 
   end 
 else 
   if (load) 
     begin 
        case (a[0]) 
          1'b0:tmp0=8'b0000_0000; 
          1'b1:tmp0=tmp; 
        endcase 
        case (a[1]) 
          1'b0:tmp1=8'b0000_0000; 
          1'b1:tmp1=tmp<<1; 
        endcase 
        case (a[2]) 
          1'b0:tmp2=8'b0000_0000; 
          1'b1:tmp2=tmp<<2; 
        endcase 
        case (a[3]) 
          1'b0:tmp3=8'b0000_0000; 
          1'b1:tmp3=tmp<<3; 
        endcase 
          op=tmp0+tmp1+tmp2+tmp3; 
          ready_out=1'b1; 
     end 
 end 
endmodule  
