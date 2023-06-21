/*Create two tasks each capable of sending a message to Console at a fixed interval. 
Assume Task1 sends the message "Task 1 Trigger" at an interval of 20 ns while Task2 sends the message "Task 2 Trigger" at an interval of 40 ns. 
Keep the count of the number of times Task 1 and Task 2 trigger by adding a variable for keeping the track of task execution and incrementing 
with each trigger. Execute both tasks in parallel till 200 nsec. Display the number of times Task 1 and Task 2 executed after 200 ns before 
calling $finish for stopping the simulation.*/

 module tb;
  int count_1;
  int count_2;
   
  task first();
    forever begin
     $display("Task 1 Trigger");
     count_1++;
     #20;
    end
  endtask
  
  task second();
    forever begin
     $display("Task 2 Trigger");
     count_2++;
     #40;
    end
  endtask 
   
  task done();
	#200;
    $display("Task 1 is executed for %0d times and task 2 for %0d times",count_1,count_2);
	$finish();
  endtask
  
  initial begin
    fork
      first();
      second();
    join_none
    done();
  end
   
endmodule