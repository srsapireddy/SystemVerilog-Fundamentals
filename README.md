# SystemVerilog-Fundamentals

* Transaction Class
  - Fields required to generate the stimulus are declared in the transaction class
  - Transaction class can also be used as a placeholder for the activity monitored by the monitor on DUT signals
  - So, the first step is to declare the Fields in the transaction class
 
* Generator Class
The generator class is responsible for,
  - Generating the stimulus by randomizing the transaction class
  - Sending the randomized class to the driver
 
* Mailbox is used to send the randomized transaction to Driver,
This involves,
  - Declaring the Mailbox
  - Getting the Mailbox handle from the env class. ( because the same mailbox will be shared across generator and driver)

* Adding Event
  - Adding an event to indicate the completion of the generation process, the event will be triggered on the completion of the Generation process.
 
* Interface:
  - Interface will group the signals, specifies the direction (Modport) and Synchronize the signals(Clocking Block).
 
* Driver Class
  - Driver class is responsible for, receive the stimulus generated from the generator and drive to DUT by assigning transaction class values to interface signals.
 
* Environment
  - Environment is container class contains Mailbox, Generator and Driver.
  - Creates the mailbox, generator and driver shares the mailbox handle across the Generator and Driver.
