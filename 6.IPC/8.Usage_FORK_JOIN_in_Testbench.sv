// Example - No simulation
task pre_test();
  driv.reset();
endtask

task test();
  fork
    gen.main();
    driv.main();
    mon.main();
    sco.main();
  join_any
endtask

task post_test();
  wait(done_triggered);
  wait(gen.count == driv.trans);
  wait(gen.count == sco.trans);
endtask

// run tasks
task run;
  pre_test();
  test();
  post_test();
  $finish();
endtask

endclass