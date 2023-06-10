/*Assume the class consists of three 4-bit data members a, b, and c. 
Create a Custom Constructor that allows the user to update the value of these data members while adding a constructor to the class. 
Test your code by adding the value of 2, 4, and 56 to a, b and c respectively.*/

 class first;
      
   bit [3:0] a;
   bit [3:0] b;
   bit [3:0] c;
   bit [4:0] sum;
     
   function new(input bit[3:0] a = 4'b0000, input bit[3:0] b = 4'b0000, input bit[3:0] c = 4'b0000);
     this.a = a;
     this.b = b;
     this.c = c;
   endfunction
   
   task display();
     sum = a + b + c;
     $display("Sum: %0d", sum); 
   endtask
     
endclass
     
     
module tb;
      
      first f1;
      
      initial begin
        f1 = new(1,2,4);
        f1.display();
      end
endmodule