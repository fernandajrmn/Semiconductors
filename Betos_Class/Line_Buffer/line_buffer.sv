// ============================================================
// Interface para Line Buffer + Ventana 3x3
// ============================================================

interface line_buffer_if (
    input logic clk,
    input logic rst_n
);

    // --------------------------------------------------------
    // Entrada desde el DMA
    // --------------------------------------------------------
    logic       in_valid;
    logic [7:0] in_data;
    logic       in_ready;


    // --------------------------------------------------------
    // Salida hacia Sobel
    // --------------------------------------------------------
    logic       out_valid;
    logic       out_ready;

    logic [7:0] p00, p01, p02;
    logic [7:0] p10, p11, p12;
    logic [7:0] p20, p21, p22;


    // --------------------------------------------------------
    // DMA
    // --------------------------------------------------------
    modport dma (
        input  clk, rst_n,

        output in_valid,
        output in_data,
        input  in_ready
    );


    // --------------------------------------------------------
    // Line Buffer
    // --------------------------------------------------------
    modport line_buffer (
        input  clk, rst_n,

        input  in_valid,
        input  in_data,
        output in_ready,

        output out_valid,

        output p00, p01, p02,
        output p10, p11, p12,
        output p20, p21, p22,

        input  out_ready
    );


    // --------------------------------------------------------
    // Sobel
    // --------------------------------------------------------
    modport sobel (
        input  clk, rst_n,

        input  out_valid,

        input  p00, p01, p02,
        input  p10, p11, p12,
        input  p20, p21, p22,

        output out_ready
    );

endinterface



// ============================================================
// Line Buffer + Generador de Ventana 3x3
// ============================================================

module line_buffer_window_3x3 #(
    parameter int IMG_WIDTH  = 256,
    parameter int IMG_HEIGHT = 256
)(
    line_buffer_if.line_buffer bus
);


    // ========================================================
    // Line Buffers
    // ========================================================

    logic [7:0] line_buf_1 [0:IMG_WIDTH-1];
    logic [7:0] line_buf_2 [0:IMG_WIDTH-1];


    // Posición actual
    // col_count también funciona como índice del buffer
    logic [15:0] row_count;
    logic [15:0] col_count;


    // Indica que ya terminamos toda la imagen + padding
    logic done;


    // Control de avance
    logic real_pixel;
    logic shift_enable;



    // ========================================================
    // Handshake
    // ========================================================

    // Estamos en un píxel real cuando todavía estamos
    // dentro del ancho y alto reales de la imagen
    assign real_pixel =
        (row_count < IMG_HEIGHT) &&
        (col_count < IMG_WIDTH);


    // El DMA solo puede enviar durante posiciones reales.
    // En las posiciones de padding generamos el cero nosotros.
    assign bus.in_ready =
        real_pixel && bus.out_ready && !done;


    // Si estamos en un píxel real necesitamos valid del DMA.
    // Si estamos en padding, nosotros mismos generamos el cero.
    assign shift_enable =
        !done &&
        bus.out_ready &&
        (real_pixel ? bus.in_valid : 1'b1);



    // ========================================================
    // Line Buffers + Ventana + Padding
    // ========================================================

    always_ff @(posedge bus.clk or negedge bus.rst_n) begin

        if (!bus.rst_n) begin

            row_count <= '0;
            col_count <= '0;
            done      <= 1'b0;

            bus.out_valid <= 1'b0;

            bus.p00 <= '0;
            bus.p01 <= '0;
            bus.p02 <= '0;

            bus.p10 <= '0;
            bus.p11 <= '0;
            bus.p12 <= '0;

            bus.p20 <= '0;
            bus.p21 <= '0;
            bus.p22 <= '0;

        end


        // ----------------------------------------------------
        // Sobel todavía no recibe la ventana
        // ----------------------------------------------------
        else if (bus.out_valid && !bus.out_ready) begin

            bus.out_valid <= 1'b1;

        end


        // ----------------------------------------------------
        // Procesar siguiente píxel o padding
        // ----------------------------------------------------
        else if (shift_enable) begin


            // =================================================
            // 1. Guardar solamente los píxeles REALES
            // =================================================

            if (real_pixel) begin

                // Fila anterior -> LB2
                line_buf_2[col_count] <= line_buf_1[col_count];

                // Fila actual -> LB1
                line_buf_1[col_count] <= bus.in_data;

            end



            // =================================================
            // 2. Inicio de una fila
            //    Padding izquierdo
            // =================================================

            if (col_count == 0) begin

                bus.p00 <= '0;
                bus.p01 <= '0;

                bus.p10 <= '0;
                bus.p11 <= '0;

                bus.p20 <= '0;
                bus.p21 <= '0;


                // ---------------------------------------------
                // Fila superior
                // ---------------------------------------------

                // Si todavía no existen dos filas anteriores,
                // ponemos cero.
                if (row_count < 2)
                    bus.p02 <= '0;
                else
                    bus.p02 <= line_buf_2[col_count];


                // ---------------------------------------------
                // Fila central
                // ---------------------------------------------

                // En la primera fila no existe fila anterior.
                if (row_count == 0)
                    bus.p12 <= '0;
                else
                    bus.p12 <= line_buf_1[col_count];


                // ---------------------------------------------
                // Fila inferior
                // ---------------------------------------------

                // Si estamos dentro de la imagen usamos DMA.
                // Si estamos en la fila inferior de padding,
                // ponemos cero.
                if (real_pixel)
                    bus.p22 <= bus.in_data;
                else
                    bus.p22 <= '0;

            end


            // =================================================
            // 3. Movimiento normal de la ventana
            // =================================================

            else begin

                // ---------------------------------------------
                // Fila superior
                // ---------------------------------------------

                bus.p00 <= bus.p01;
                bus.p01 <= bus.p02;

                // col == IMG_WIDTH significa padding derecho
                if (col_count == IMG_WIDTH)
                    bus.p02 <= '0;

                // Primeras filas: padding superior
                else if (row_count < 2)
                    bus.p02 <= '0;

                else
                    bus.p02 <= line_buf_2[col_count];


                // ---------------------------------------------
                // Fila central
                // ---------------------------------------------

                bus.p10 <= bus.p11;
                bus.p11 <= bus.p12;

                if (col_count == IMG_WIDTH)
                    bus.p12 <= '0;

                else if (row_count == 0)
                    bus.p12 <= '0;

                else
                    bus.p12 <= line_buf_1[col_count];


                // ---------------------------------------------
                // Fila inferior
                // ---------------------------------------------

                bus.p20 <= bus.p21;
                bus.p21 <= bus.p22;

                if (real_pixel)
                    bus.p22 <= bus.in_data;
                else
                    bus.p22 <= '0;

            end



            // =================================================
            // 4. out_valid
            // =================================================

            // La ventana generada corresponde al píxel
            // (row_count - 1, col_count - 1).
            //
            // Por eso desde row=1 y col=1 ya tenemos una
            // ventana válida gracias al zero-padding.

            if (row_count >= 1 && col_count >= 1)
                bus.out_valid <= 1'b1;
            else
                bus.out_valid <= 1'b0;



            // =================================================
            // 5. Avanzar fila / columna
            // =================================================

            // IMG_WIDTH es la columna virtual de padding derecho
            if (col_count == IMG_WIDTH) begin

                col_count <= '0;

                // IMG_HEIGHT es la fila virtual inferior
                if (row_count == IMG_HEIGHT) begin

                    done <= 1'b1;

                end
                else begin

                    row_count <= row_count + 1'b1;

                end

            end

            else begin

                col_count <= col_count + 1'b1;

            end

        end


        // No hay dato nuevo
        else begin

            bus.out_valid <= 1'b0;

        end

    end


endmodule