module PWM #(parameter int size = 10) (

    input logic clk,
    input logic enable,
    input logic reset,
    input logic [7:0] duty_cycle,
    input logic [size-1:0] PSC,
    input logic [size-1:0] ARR,
    output logic pwm
);

    logic [size-1:0] PSC_counter;
    logic [size-1:0] CNT;
    logic [size:0] CCR;
    assign CCR = (duty_cycle * (ARR + 1)) / 100;


    always_ff @(posedge clk or posedge reset)
    begin
        if (reset)
        begin
            PSC_counter <= 0;
            CNT <= 0;
        end
        else if (!enable)
        begin
            PSC_counter <= 0;
            CNT <= 0;
        end
        else
        begin
            if (PSC_counter == PSC)
            begin
                PSC_counter <= 0;
                if (CNT == ARR)
                    CNT <= 0;
                else
                    CNT <= CNT + 1'b1;
            end
            else
                PSC_counter <= PSC_counter + 1'b1;
        end
    end


    always_comb
    begin
        if (reset || !enable)
            pwm = 0;
        else if (CNT < CCR)
            pwm = 1;
        else
            pwm = 0;
    end

endmodule