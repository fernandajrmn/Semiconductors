`timescale 1ns / 1ps

module APB_tb;

logic clk;
logic rst_n;

logic [31:0] read_data;
logic [31:0] CTRL;

logic core_busy;
logic core_done;
logic start_pulse;



//interface APB_if
APB_if apb (.*);



bus_slave dut (
    .bus(apb),
    .core_busy(core_busy),
    .core_done(core_done),
    .start_pulse(start_pulse)
);


initial clk = 0;
always #5 clk = ~clk;


initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, APB_tb);
end


// write task
task apb_write(
    input logic [31:0] address,
    input logic [31:0] data
);
begin

    // setup
    @(negedge clk);

    apb.psel    = 1'b1;
    apb.penable = 1'b0;
    apb.pwrite  = 1'b1;
    apb.paddr   = address;
    apb.pwdata  = data;


    // access
    @(negedge clk);

    apb.penable = 1'b1;

    //se escribe la cosa esa


    // nada, 
    @(negedge clk);

    apb.psel    = 1'b0;
    apb.penable = 1'b0;
    apb.pwrite  = 1'b0;

end
endtask


// read task
task apb_read(
    input  logic [31:0] address,
    output logic [31:0] data
);
begin

    // SETUP
    @(negedge clk);

    apb.psel    = 1'b1;
    apb.penable = 1'b0;
    apb.pwrite  = 1'b0;
    apb.paddr   = address;


    // ACCESS
    @(negedge clk);

    apb.penable = 1'b1;


    // Leer PRDATA durante ACCESS
    @(posedge clk);
    #1;

    data = apb.prdata;


    // IDLE
    @(negedge clk);

    apb.psel    = 1'b0;
    apb.penable = 1'b0;

end
endtask


//prueba for real

initial begin
    
    $monitor(
        "Tiempo = %0t | SRC_ADDR = %h | DST_ADDR = %h | CTRL = %h | STATUS = %h | start_pulse = %b",$time,dut.SRC_ADDR,dut.DST_ADDR,dut.CTRL,dut.STATUS,start_pulse
    );


    // initial values
    rst_n       = 1'b0;
    core_busy   = 1'b0;
    core_done   = 1'b0;
    read_data   = '0;

    apb.psel    = 1'b0;
    apb.penable = 1'b0;
    apb.pwrite  = 1'b0;
    apb.paddr   = '0;
    apb.pwdata  = '0;


    // Reset 
    #10; rst_n = 1'b1;


    // write src_addr
    apb_write(
        32'h0000_0008,
        32'h1000_0000
    );


    // write dst_addr
    apb_write(
        32'h0000_000C,
        32'h2000_0000
    );


    // start =1
    apb_write(
        32'h0000_0000,
        32'h0000_0001
    );


    // start se que activa por 1 ciclo

    if (start_pulse == 1'b1)
        $display("PASS: start_pulse se activo");
    else
        $display("FAIL: start_pulse no se activo");


    // En el siguiente ciclo debe regresar a 0
    @(posedge clk);
    #1;

    if (start_pulse == 1'b0)
        $display("PASS: start_pulse duro solo 1 ciclo");
    else
        $display("FAIL: start_pulse sigue activo");


    // supner que el sobel esta jalando

    core_busy = 1'b1;
    core_done = 1'b0;


    // status = 1
    apb_read(
        32'h0000_0004,
        read_data
    );


    if (read_data == 32'h0000_0001)
        $display("PASS: STATUS = %h", read_data);
    else
        $display("FAIL: STATUS = %h", read_data);


    #20;
    $finish;

end

endmodule
