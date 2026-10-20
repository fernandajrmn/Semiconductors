`timescale 1ns/1ps

module dma_tb;

logic clk;
logic rst_n;

logic cpu_steal;
logic busy;


initial clk = 0;
always #5 clk = ~clk;



dma_if bus (.*);



cpu CPU (
    .cpu(bus)
);

dma DMA (
    .dma(bus)
);

memory_model MEMORY (
    .sram(bus),
    .cpu_steal(cpu_steal)
);

ip ACCELERATOR (
    .accelerator(bus),
    .busy(busy)
);



initial begin
    $monitor(
        "T=%0t | start=%b done=%b | req=%b gnt=%b addr=%h data=%0d | valid=%b ready=%b axis_data=%0d | steal=%b busy=%b | clk =%b | rst_n = %b | state =%b | next_state = %b",
        $time,
        bus.ctrl_start,
        bus.ctrl_done,
        bus.mem_request,
        bus.mem_gnt,
        bus.mem_addr,
        bus.mem_data,
        bus.axis_valid,
        bus.axis_ready,
        bus.axis_data,
        cpu_steal,
        busy,
        clk, 
        rst_n,
        DMA.state,
        DMA.next_state
    );
end



initial begin

    // Valores iniciales
    rst_n     = 0;
    cpu_steal = 0;
    busy      = 0;

    #20;
    rst_n = 1;


    // TEST 1: Transferencia normal
    $display("\n========== TEST 1: NORMAL ==========\n");

    wait(bus.ctrl_done);

    #10;


    // TEST 2: Cycle Stealing
    $display("\n========== TEST 2: CYCLE STEALING ==========\n");

    // Reiniciar sistema
    rst_n = 0;
    cpu_steal = 1;
    busy = 0;

    #20;
    rst_n = 1;

    // memoria robada
    #40;

    // Libera la memoria
    cpu_steal = 0;

    wait(bus.ctrl_done);

    #10;


    // TEST 3: Backpressure
    $display("\n========== TEST 3: BACKPRESSURE ==========\n");

    // Reiniciar sistema
    rst_n = 0;
    cpu_steal = 0;
    busy = 1;

    #20;
    rst_n = 1;

    // El acelerador permanece ocupado por 40 ns
    #40;

    busy = 0;

    wait(bus.ctrl_done);

    #20;

    $display("\n========== Si sirviooo ==========\n");

    $finish;

end


endmodule