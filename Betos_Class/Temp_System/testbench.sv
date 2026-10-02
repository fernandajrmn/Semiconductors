`timescale 1ns/1ps

module tb_top;

    logic clk;
    logic rst_n;

    // Generador de reloj (10 ns)
    always #5 clk = ~clk;

    // Instanciación del Top System
    Temp_top dut (
        .clk   (clk),
        .rst_n (rst_n)
    );

    initial begin
        clk   = 0;
        rst_n = 0;

        // Monitoreo de señales desde la interfaz dentro del DUT
        $monitor("Tiempo = %0t ns | Temp = %d °C | ALARMA = %b",
                 $time,
                 dut.Temp_inst.rtemp,
                 dut.Temp_inst.alert);

        #15 rst_n = 1; // Liberar reset

        #100; // Correr simulación por unos ciclos
        $finish;
    end

endmodule
