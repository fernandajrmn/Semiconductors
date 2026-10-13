interface APB_if (
    input logic clk, 
    input logic rst_n
);

    // Selector
    logic psel;

    // Data / Address
    logic [31:0] paddr;
    logic [31:0] pwdata;
    logic [31:0] prdata;

    //Flags
    logic penable;
    logic pwrite;
    logic pready;
    logic pslverr;


    modport master (
        input  clk, rst_n,
        output psel, paddr, pwdata, pwrite, penable,
        input  prdata, pready, pslverr
    );


    modport slave (
        input  clk, rst_n,
        input  pwrite, psel, penable, paddr, pwdata,
        output prdata, pready, pslverr
    );

endinterface

// Module slave
module bus_slave (
	APB_if.slave bus,
	input logic core_busy,
	input logic core_done,
	output logic start_pulse
	
);

//Register Bank
logic [31:0] CTRL;
logic [31:0]STATUS;
logic [31:0]SRC_ADDR;
logic [31:0]DST_ADDR;

logic addr_valid;
assign addr_valid = (bus.paddr[31:4] == 28'h0 && bus.paddr[1:0] == 2'b0);
assign STATUS = {30'b0, core_done, core_busy};

always_ff @(posedge bus.clk or negedge bus.rst_n)
begin
    if (!bus.rst_n) begin
        CTRL        <= '0;
        SRC_ADDR    <= '0;
        DST_ADDR    <= '0;
        start_pulse <= 1'b0;
    end
    else begin
        start_pulse <= 1'b0;
        CTRL[0]     <= 1'b0;

        if (bus.psel && bus.penable && bus.pwrite && addr_valid) begin
            case (bus.paddr[3:0])

                4'h0: begin
                    CTRL[1] <= bus.pwdata[1];
                    CTRL[0] <= bus.pwdata[0];

                    if (bus.pwdata[0])
                        start_pulse <= 1'b1;
                end

                4'h8: SRC_ADDR <= bus.pwdata;
                4'hC: DST_ADDR <= bus.pwdata;

                default: ;
            endcase
        end
    end
end

always_comb
begin
    bus.pready  = 1'b0;
    bus.pslverr = 1'b0;
    bus.prdata  = '0;

    if (bus.psel && bus.penable)
        bus.pready = 1'b1;

    if (bus.psel && bus.penable && !addr_valid)
        bus.pslverr = 1'b1;

    else if (bus.psel && bus.penable && !bus.pwrite && addr_valid)
    begin
        case (bus.paddr[3:0])
            4'h0: bus.prdata = CTRL;
            4'h4: bus.prdata = STATUS;
            4'h8: bus.prdata = SRC_ADDR;
            4'hC: bus.prdata = DST_ADDR;
            default: bus.prdata = '0;
        endcase
    end
end


endmodule

