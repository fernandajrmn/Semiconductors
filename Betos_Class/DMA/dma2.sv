interface dma_if (
    input clk,
    input rst_n
);

    // A
    logic ctrl_start;
    logic [31:0] src_addr;
    logic [31:0] frame_size;
    logic ctrl_done;

    // B
    logic mem_request;
    logic mem_gnt;
    logic [31:0] mem_addr;
    logic [7:0] mem_data;

    // C
    logic axis_valid;
    logic [7:0] axis_data;
    logic axis_ready;


    modport controller (
        input clk, rst_n, ctrl_done,
        output ctrl_start, src_addr, frame_size
    );

    modport memory (
        input clk, rst_n, mem_request, mem_addr,
        output mem_gnt, mem_data
    );

    modport receptor (
        input clk, rst_n, axis_valid, axis_data,
        output axis_ready
    );

    modport motor (
        input clk, rst_n, ctrl_start, src_addr, frame_size,
              mem_gnt, mem_data, axis_ready,
        output ctrl_done, mem_request, mem_addr,
               axis_valid, axis_data
    );

endinterface





module ip (
    dma_if.receptor accelerator,
    input logic busy
);

logic [7:0] buffer_accelerator;

always_ff @(posedge accelerator.clk or negedge accelerator.rst_n) begin
    if (!accelerator.rst_n) begin
        accelerator.axis_ready <= 1'b0;
        buffer_accelerator     <= 8'b0;
    end
    else begin

        if (busy) begin
            accelerator.axis_ready <= 1'b0;
        end

        else begin
            accelerator.axis_ready <= 1'b1;

            if (accelerator.axis_valid) begin
                buffer_accelerator <= accelerator.axis_data;
            end
        end
    end
end
endmodule




module memory_model (
    dma_if.memory sram,
    input logic cpu_steal
);

always_ff @(posedge sram.clk or negedge sram.rst_n) begin

    if (!sram.rst_n) begin
        sram.mem_gnt <= 1'b1;
    end
    else begin
        if (cpu_steal)
            sram.mem_gnt <= 1'b0;
        else
            sram.mem_gnt <= 1'b1;
    end

end


always_comb begin

    case (sram.mem_addr)

        32'h10: sram.mem_data = 8'd10;
        32'h11: sram.mem_data = 8'd20;
        32'h12: sram.mem_data = 8'd30;
        32'h13: sram.mem_data = 8'd40;
        32'h14: sram.mem_data = 8'd50;

        default: sram.mem_data = 8'd0;

    endcase

end

endmodule






module cpu (
    dma_if.controller cpu
);

logic started;

always_ff @(posedge cpu.clk or negedge cpu.rst_n) begin

    if (!cpu.rst_n) begin
        cpu.ctrl_start <= 1'b0;
        cpu.src_addr   <= '0;
        cpu.frame_size <= '0;
        started        <= 1'b0;
    end
    else begin

        //apagado
        cpu.ctrl_start <= 1'b0;

        // inicia 1 vez
        if (!started) begin
            cpu.ctrl_start <= 1'b1;
            cpu.src_addr   <= 32'h10;
            cpu.frame_size <= 32'd5;
            started        <= 1'b1;
        end

    end

end

endmodule


module dma (
    dma_if.motor dma
);

    // FSM
    localparam IDLE   = 2'b00;
    localparam FETCH  = 2'b01;
    localparam STREAM = 2'b10;

    logic [1:0] state, next_state;


    // Contadores y Datos Internos
    logic [31:0] addr_cnt;
    logic [15:0] pixel_cnt;
    logic [7:0] pixel_buffer;


    // Registro Secuencial de Estados
    always_ff @(posedge dma.clk or negedge dma.rst_n) begin
        if (!dma.rst_n) begin
            state <= IDLE;
        end
        else begin
            state <= next_state;
        end
    end


    // Actualizacion de registros internos
    always_ff @(posedge dma.clk or negedge dma.rst_n) begin
        if (!dma.rst_n) begin
            addr_cnt     <= 32'b0;
            pixel_cnt    <= 16'b0;
            pixel_buffer <= 8'b0;
        end
        else begin
            case (state)

                IDLE: begin
                    pixel_cnt <= 16'b0;

                    if (dma.ctrl_start) begin
                        addr_cnt <= dma.src_addr;
                    end
                end

                FETCH: begin
                    if (dma.mem_gnt) begin
                        pixel_buffer <= dma.mem_data;
                    end
                end

                STREAM: begin
                    if (dma.axis_valid && dma.axis_ready) begin
                        addr_cnt  <= addr_cnt + 1'b1;
                        pixel_cnt <= pixel_cnt + 1'b1;
                    end
                end

            endcase
        end
    end


    // Transicion entre los 3 Estados (Logica Combinacional)
    always_comb begin
        next_state = state;

        case (state)

            IDLE: begin
                if (dma.ctrl_start) begin
                    next_state = FETCH;
                end
            end

            FETCH: begin
                // Espera a que la memoria le de acceso (mem_gnt = 1)
                if (dma.mem_gnt) begin
                    next_state = STREAM;
                end
            end

            STREAM: begin
                // Avanza solo cuando la transferencia actual se completa
                if (dma.axis_valid && dma.axis_ready) begin

                    if (pixel_cnt == dma.frame_size - 1'b1) begin
                        next_state = IDLE;
                    end
                    else begin
                        next_state = FETCH;
                    end

                end
            end

            default: next_state = IDLE;

        endcase
    end


    // Asignaciones de salida
    assign dma.mem_request = (state == FETCH);
    assign dma.mem_addr    = addr_cnt;
    assign dma.axis_valid  = (state == STREAM);
    assign dma.axis_data   = pixel_buffer;


    // Pulso al terminar el ultimo pixel
    assign dma.ctrl_done = (state == STREAM) &&
                           (dma.axis_valid && dma.axis_ready) &&
                           (pixel_cnt == dma.frame_size - 1'b1);


endmodule
